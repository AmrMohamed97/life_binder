import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_image_cubit/personal_image_state.dart';

class PersonalImageCubit extends Cubit<PersonalImageState> {
  PersonalImageCubit() : super(PersonalImageInitial());

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

}