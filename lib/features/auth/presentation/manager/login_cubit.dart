import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note_app/features/auth/presentation/manager/auth_state.dart';

class LoginCubit extends Cubit<AuthState> {
  LoginCubit() : super(AuthInitialState());

  late String email, password, userName;
  bool isLoading = false;
  void changeLoadingState({required bool state}) {
    isLoading = state;
    emit(ChangeLoadingState());
  }

  Future<void> signIn(context) async {
    isLoading = true;
    emit(SignInLoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AwesomeDialog(
          context: context,
          title: 'error',
          body: const Text('user not found'),
        ).show();
      } else if (e.code == 'wrong-password') {
        AwesomeDialog(
          context: context,
          title: 'error',
          body: const Text('user not found'),
        ).show();
      } else {
        AwesomeDialog(
          context: context,
          title: 'error',
          body: Text(e.code.toString()),
        ).show();
      }
      emit(SignInErrorState());
    } catch (error) {
      AwesomeDialog(
        context: context,
        title: 'error',
        body: Text(error.toString()),
      ).show();
      emit(SignInErrorState());
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> addGoogleUser({required userName, required email}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    QuerySnapshot getEmail = await users.where('email', isEqualTo: email).get();
    if (getEmail.docs.isEmpty) {
      users.add({
        'user name': userName,
        'email': email,
        'uid': FirebaseAuth.instance.currentUser!.uid,
      });
    }
  }
}
