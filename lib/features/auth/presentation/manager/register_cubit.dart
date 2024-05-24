import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/auth/presentation/manager/auth_state.dart';

class RegisterCubit extends Cubit<AuthState> {
  RegisterCubit() : super(AuthInitialState());
  bool isLoading = false;
  dynamic email, password, userName;
  void changeLoadingState({required bool state}) {
    isLoading = state;
    emit(ChangeLoadingState());
  }

  Future<void> register(context) async {
    isLoading = true;
    emit(RegisterLoadingState());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        AwesomeDialog(
          context: context,
          title: 'error',
          body: const Text('email already in use'),
        ).show();
      } else if (e.code == 'weak-password') {
        AwesomeDialog(
          context: context,
          title: 'error',
          body: const Text('Password should be at least 6 characters '),
        ).show();
      } else {
        AwesomeDialog(
          context: context,
          title: 'error',
          body: Text(e.code.toString()),
        ).show();
      }
      emit(RegisterErrorState());
    } catch (error) {
      print('$error......................................');
      AwesomeDialog(
        context: context,
        title: 'error',
        body: Text(error.runtimeType.toString()),
      ).show();
      emit(RegisterErrorState());
    }
  }

  Future<void> addUser() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.add({
      'user name': userName,
      'email': email,
      'uid': FirebaseAuth.instance.currentUser!.uid,
    });
  }
}
