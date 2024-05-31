import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/edit_note/data/model/notes_model.dart';
 import 'package:note_app/features/search/manager/search_state.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(InitialSearchState());
  TextEditingController searchController = TextEditingController();
  void assignControllerValue(value) {
    searchController.text = value;
    emit(AssignControllerValueState());
  }

  List<NotesModel> searchNote = [];
  Future<void> searchData({required searchItem}) async {
    emit(SearchLoadingState());
    try {
      FirebaseFirestore.instance
          .collection('notes')
          .where('userUid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .orderBy('title')
          .startAt(['$searchItem'])
          .endAt(['$searchItem' '\uf8ff'])
          .snapshots()
          .listen((event) {
            if (event.docs.isNotEmpty) {
              searchNote = [];
              for (var element in event.docs) {
                searchNote.add(NotesModel.fromJson(element));
              }
              emit(SearchSuccessState());
            } else {
              searchNote = [];
              emit(SearchSuccessWithoutDataState());
            }
          });
    } catch (error) {
      debugPrint('$error..........................................................');
      emit(SearchErrorState(error: error));
    }
  }
}