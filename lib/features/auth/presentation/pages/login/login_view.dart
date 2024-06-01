import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/auth/presentation/manager/login_cubit.dart';
import 'package:note_app/features/auth/presentation/pages/login/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
   @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          body: LoginBody(),
        ),
      ),
    );
  }
}
