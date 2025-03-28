import 'package:flutter/material.dart';
import 'package:note_app/core/constants/constances.dart';
import 'package:note_app/core/routes/pages_keys.dart';
import 'package:note_app/features/auth/presentation/manager/login_cubit.dart';

void signInWithGoogle(LoginCubit cubit, BuildContext context) async {
    cubit.changeLoadingState(state: true);
    try {
  await cubit.signInWithGoogle().then((value) async{
     await  cubit.addGoogleUser(
        userName: value.user?.displayName, email: value.user?.email);
     cubit.changeLoadingState(state: false);
      navigatorKey.currentState?.pushReplacementNamed( PagesKeys.personalPageView);
  }).catchError((error) {
    cubit.changeLoadingState(state: false);
     
  });
}   catch (e) {cubit.changeLoadingState(state: false);
debugPrint(e.toString());}
  }
