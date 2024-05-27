import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:note_app/features/edit_note/data/model/notes_model.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_cubit/personal_page_state.dart';
 
class PersonalPageCubit extends Cubit<PersonalPageState> {
  PersonalPageCubit() : super(PersonalPageInitialState());
  String personalImage = '';
  String backgroundImage = '';
  String? userName;
  List<NotesModel> notes = [];
  CollectionReference personalCollection =
      FirebaseFirestore.instance.collection('personal');

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
