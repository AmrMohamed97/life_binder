import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app/features/edit_note/data/model/notes_model.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_cubit/personal_page_state.dart';
import 'package:note_app/features/personal_page/presentation/pages/personal_page_view.dart';

class PersonalPageCubit extends Cubit<PersonalPageState> {
  PersonalPageCubit() : super(PersonalPageInitialState());
  // bool isLoading = false;
  // File? personalFile;
  // String? personalImageUrl;
  // Reference? storageRefer;
  // String fileName = 'personalImage';
  String personalImage = '';
  String backgroundImage = '';
  String? userName;
  CollectionReference personalCollection =
      FirebaseFirestore.instance.collection('personal');
  // void changeLoadingState({required bool load}) {
  //   isLoading = load;
  //   emit(ChangeLoadState());
  // }

  // Future<void> getPersonalOrBackgroundImage(context, {required folder}) async {
  //   try {
  //     final returnedImage =
  //         await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (returnedImage == null) return;
  //     personalFile = File(returnedImage.path);
  //     storageRefer = FirebaseStorage.instance
  //         .ref('$folder/$folder${FirebaseAuth.instance.currentUser!.uid}');
  //     changeLoadingState(load: true);
  //     await storageRefer?.putFile(personalFile!);
  //     personalImageUrl = await storageRefer?.getDownloadURL();
  //     await personalCollection
  //         .doc('$folder${FirebaseAuth.instance.currentUser!.uid}')
  //         .set({
  //       'imageURL': personalImageUrl,
  //       'fileName': fileName,
  //       'userUid': FirebaseAuth.instance.currentUser!.uid,
  //     });
  //     changeLoadingState(load: false);
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text(
  //         'your image uploaded success',
  //         style: TextStyle(
  //           color: AppColors.white,
  //         ),
  //       ),
  //       duration: Duration(
  //         seconds: 3,
  //       ),
  //       backgroundColor: AppColors.lightGreen,
  //     ));
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const PersonalPageView(),
  //         ));
  //     emit(AddPersonalOrBackgroundImageSuccess());
  //   } catch (e) {
  //     changeLoadingState(load: false);
  //     AwesomeDialog(
  //       context: context,
  //       title: 'error',
  //       body: Text(e.toString()),
  //     ).show();
  //     emit(AddPersonalOrBackgroundImageError());
  //   }
  // }

  // Future<void> picPersonalOrBackgroundImage(context, {required folder}) async {
  //   try {
  //     final returnedImage =
  //         await ImagePicker().pickImage(source: ImageSource.camera);
  //     if (returnedImage == null) return;
  //     changeLoadingState(load: true);
  //     personalFile = File(returnedImage.path);
  //     storageRefer = FirebaseStorage.instance
  //         .ref('$folder/$folder${FirebaseAuth.instance.currentUser!.uid}');
  //     await storageRefer?.putFile(personalFile!);
  //     personalImageUrl = await storageRefer?.getDownloadURL();
  //     await personalCollection
  //         .doc('$folder${FirebaseAuth.instance.currentUser!.uid}')
  //         .set({
  //       'imageURL': personalImageUrl,
  //       'fileName': fileName,
  //       'userUid': FirebaseAuth.instance.currentUser!.uid,
  //     });
  //     changeLoadingState(load: false);
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text(
  //         'your image uploaded success',
  //         style: TextStyle(
  //           color: AppColors.white,
  //         ),
  //       ),
  //       duration: Duration(
  //         seconds: 3,
  //       ),
  //       backgroundColor: AppColors.lightGreen,
  //     ));
  //     emit(AddPersonalOrBackgroundImageSuccess());
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const PersonalPageView(),
  //         ));
  //   } catch (e) {
  //     changeLoadingState(load: false);
  //     AwesomeDialog(
  //       context: context,
  //       title: 'error',
  //       body: Text(e.toString()),
  //     ).show();
  //     emit(AddPersonalOrBackgroundImageError());
  //   }
  // }

  // Future<void> deletePersonalOrBackGroundImage(context,
  //     {required folder}) async {
  //   emit(ImageDeleteLoading());
  //   try {
  //     changeLoadingState(load: true);
  //     await personalCollection
  //         .doc('$folder${FirebaseAuth.instance.currentUser!.uid}')
  //         .delete();
  //     await FirebaseStorage.instance
  //         .ref('$folder/$folder${FirebaseAuth.instance.currentUser!.uid}')
  //         .delete();
  //     changeLoadingState(load: false);
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text(
  //         'image deleted success',
  //         style: TextStyle(
  //           color: AppColors.white,
  //         ),
  //       ),
  //       duration: Duration(
  //         seconds: 3,
  //       ),
  //       backgroundColor: AppColors.lightGreen,
  //     ));
  //     emit(ImageDeletedSuccess());
  //   } on Exception catch (e) {
  //     changeLoadingState(load: false);
  //     AwesomeDialog(
  //       context: context,
  //       title: 'error',
  //       body: Text(e.toString()),
  //     ).show();
  //     emit(ImageDeletedError());
  //   }
  // }
  //----------------------------------------------------------------------------

  Future<void> getPersonalImage() async {
    emit(GetPersonalImageLoadingState());
    personalCollection
        .doc('personal${FirebaseAuth.instance.currentUser!.uid}')
        .get()
        .then((value) {
      if (value.exists) {
        personalImage = value['imageURL'];
         emit(GetPersonalImageSuccessState());
      } else {
        personalImage = '';
         emit(GetPersonalImageSuccessWithoutData());
      }
    }).catchError((error) {
       emit(GetPersonalImageErrorState());
    });
  }

  Future<void> getBackgroundImage() async {
    emit(GetBackgroundImageLoadingState());
    personalCollection
        .doc('background${FirebaseAuth.instance.currentUser!.uid}')
        .get()
        .then((value) {
      if (value.exists) {
        backgroundImage = value['imageURL'];
        emit(GetBackgroundImageSuccessState());
      } else {
        backgroundImage = '';
         emit(GetBackgroundImageSuccessWithoutData());
      }
    }).catchError((error) {
       emit(GetBackgroundImageErrorState());
    });
  }

  Future<void> getUserName() async {
    FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        userName = value.docs[0]['user name'];
        emit(GetUserNameSuccessState());
      } else {
        emit(GetUserNameSuccessWithoutData());
      }
    }).catchError((error) {
      emit(GetUserNameErrorState());
    });
  }

//------------------------------------------------------------------------------
  List<NotesModel> notes = [];
  Future<void> getUserNotes() async {
    emit(GetUserNotesLoadingState());
    try {
      FirebaseFirestore.instance
          .collection('notes')
          .where('userUid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .listen((event) {
        if (event.docs.isNotEmpty) {
          notes = [];
          for (var element in event.docs) {
            notes.add(NotesModel.fromJson(element));
          }
          emit(GetUserNotesSuccessState());
        } else {
          notes = [];
          emit(GetUserNotesSuccessWithNoDataState());
        }
      });
    } catch (e) {
      emit(GetUserNotesErrorState());
    }
  }

}
