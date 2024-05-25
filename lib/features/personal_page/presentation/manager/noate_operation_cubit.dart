import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/edit_note/data/model/notes_model.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_state.dart';

class NoateOperationCubit extends Cubit<PersonalPageState>{
  NoateOperationCubit() : super(PersonalPageInitialState());
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

  Future<void> deleteListItem(
      {required String id, required String imageName}) async {
    emit(DeleteItemLoadingState());
    try {
      Reference imageRefer = FirebaseStorage.instance.ref('images/$imageName');
      imageRefer.delete();
      DocumentReference doc =
          FirebaseFirestore.instance.collection('notes').doc(id);
      doc.delete();
      emit(DeleteItemSuccessState());
    } on Exception catch (error) {
      emit(DeleteItemErrorState(error: error));
    }
  }
}