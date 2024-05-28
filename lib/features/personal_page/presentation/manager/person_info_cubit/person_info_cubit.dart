import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_state.dart';

class PersonInfoCubit extends Cubit<PersonInfoState> {
  PersonInfoCubit() : super(PersonalImageInitial());
  String? userName;
  String personalImage = '';
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
}
