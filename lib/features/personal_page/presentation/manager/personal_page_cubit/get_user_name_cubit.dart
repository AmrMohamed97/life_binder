import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_cubit/get_user_name_state.dart';

class GetUserNameCubit extends Cubit<GetUserNameState> {
  GetUserNameCubit() : super(PersonalPageInitialState());
   
  String? userName;
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
