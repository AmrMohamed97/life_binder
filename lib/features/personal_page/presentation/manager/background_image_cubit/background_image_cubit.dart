import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/personal_page/presentation/manager/background_image_cubit/background_image_state.dart';

class BackgroundImageCubit extends Cubit<BackgroundImageState>{
  BackgroundImageCubit() : super(BackgroundImageIinitialState());
  String backgroundImage = '';
  CollectionReference personalCollection =
      FirebaseFirestore.instance.collection('personal');

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
}