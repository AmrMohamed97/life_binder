import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/features/edit_note/presentation/manager/edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitialState());
  bool isLoading = false;
  File? file;
  String? imageUrl, title, note;
  Reference? storageRefer;
  CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');
  final titleController = TextEditingController();
  final noteController = TextEditingController();
  void initialFormFields({required String fieldTitle, required fieldNote}) {
    if (titleController.text.isEmpty) {
      titleController.text = fieldTitle;
    }
    if (noteController.text.isEmpty) {
      noteController.text = fieldNote;
    }
  }

  Future<void> getImageFromGallery(context) async {
    try {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage == null) return;
      file = File(returnedImage.path);
      var unique = Random().nextInt(100000);
      String fileName = '$unique${basename(returnedImage.path)}';
      storageRefer = FirebaseStorage.instance.ref('images/$fileName');
      Navigator.of(context).pop();
      emit(EditImageSuccessState());
    } on Exception catch (e) {
      AwesomeDialog(
        context: context,
        title: 'error',
        body: Text(e.toString()),
      ).show();
      emit(EditImageErrorState());
    }
  }

  Future<void> picImageByCamera(context) async {
    try {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (returnedImage == null) return;
      file = File(returnedImage.path);
      var unique = Random().nextInt(100000);
      String fileName = '$unique${basename(returnedImage.path)}';
      storageRefer = FirebaseStorage.instance.ref('images/$fileName');
      Navigator.of(context).pop();
      emit(EditImageSuccessState());
    } on Exception catch (e) {
      AwesomeDialog(
        context: context,
        title: 'error',
        body: Text(e.toString()),
      ).show();
      emit(EditImageErrorState());
    }
  }

  Future<void> uploadNote(context) async {
    emit(EditUploadLoading());
    try {
      await storageRefer?.putFile(file!);
      imageUrl = await storageRefer?.getDownloadURL();
      await notesCollection.add({
        'title': title,
        'note': note,
        'imageURL': imageUrl,
        'userUid': FirebaseAuth.instance.currentUser!.uid,
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
      ));
      emit(EditUploadedSuccess());
    } on Exception catch (e) {
      AwesomeDialog(
        context: context,
        title: 'error',
        body: Text(e.toString()),
      ).show();
      emit(EditUploadError());
    }
  }

  Future<void> updateData(
      {required String id, required String imageName}) async {
    emit(EditDataLoadingState());
    try {
      if (file != null) {
        await FirebaseStorage.instance.ref('images/$imageName').putFile(file!);
        String editedUrl = await FirebaseStorage.instance
            .ref('images/$imageName')
            .getDownloadURL();
        await notesCollection.doc(id).set({
          'title': title,
          'note': note,
          'imageURL':
              editedUrl, //must written to make project sense by edited image because path not change
          'userUid': FirebaseAuth.instance.currentUser!.uid,
        }, SetOptions(merge: true));
        emit(EditDataSuccessState());
      } else {
        try {
          await notesCollection.doc(id).update({
            'title': title,
            'note': note,
          });
        } on Exception catch (e) {
          print('======================================');
          print(e.toString());
          print('======================================');
        }
        emit(EditDataSuccessState());
      }
    } catch (error) {
      emit(EditDataErrorState());
    }
  }
}
