import 'dart:io';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:path/path.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app/features/add_note/presentation/manager/add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState>{
  AddNoteCubit():super(AddNoteInitialState());
  bool isLoading=false;
  File? file;
  String? imageUrl,title ,note ,fileName;
  Reference? storageRefer;
  CollectionReference notesCollection=FirebaseFirestore.instance.collection('notes');
   Future<void> getImageFromGallery(context)async{
    try {
      final returnedImage=await ImagePicker().pickImage(source: ImageSource.gallery);
      if(returnedImage==null) return;
      file=File(returnedImage.path);
      var unique=Random().nextInt(100000);
      fileName='$unique${basename(returnedImage.path)}';
      storageRefer=FirebaseStorage.instance.ref('images/$fileName');
      Navigator.of(context).pop();
      emit(AddImageSuccessState());
    } on Exception catch (e) {
      AwesomeDialog(
        context: context,
        title: 'error',
        body: Text(e.toString()),
      ).show();
      emit(AddImageErrorState());
    }
  }
  Future<void> picImageByCamera(context)async{
    try {
      final returnedImage=await ImagePicker().pickImage(source: ImageSource.camera);
      if(returnedImage==null) return;
      file=File(returnedImage.path);
      var unique=Random().nextInt(100000);
      fileName='$unique${basename(returnedImage.path)}';
      storageRefer=FirebaseStorage.instance.ref('images/$fileName');
      Navigator.of(context).pop();
      emit(AddImageSuccessState());
    } on Exception catch (e) {
      AwesomeDialog(
        context: context,
        title: 'error',
        body: Text(e.toString()),
      ).show();
      emit(AddImageErrorState());
    }
  }
  Future<void> uploadNote(context)async{
     emit(NoteUploadLoading());
    try {
      await storageRefer?.putFile(file!);
      imageUrl = await storageRefer?.getDownloadURL();
      await notesCollection.add({
        'title': title,
        'note': note,
        'imageURL': imageUrl,
        'imageName': fileName,
        'userUid':FirebaseAuth.instance.currentUser!.uid,
        'date':DateTime.now(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'your note uploaded success',
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
            duration: Duration(
              seconds: 3,
            ),
            backgroundColor: AppColors.lightGreen,
          )
      );
      emit(NoteUploadedSuccess());
    } on Exception catch (e) {
      AwesomeDialog(
        context: context,
        title: 'error',
        body: Text(e.toString()),
      ).show();
      emit(NoteUploadError());
    }
  }
}