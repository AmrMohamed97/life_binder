import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_state.dart';

class DeleteListItemCubit extends Cubit<PersonalPageState> {
  DeleteListItemCubit() : super(PersonalPageInitialState());
  
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