import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
 import 'package:note_app/features/auth/presentation/manager/auth_state.dart';
import 'package:note_app/features/auth/presentation/manager/login_cubit.dart';
import 'package:note_app/core/routes/pages_keys.dart';
import 'package:note_app/features/auth/presentation/pages/login/widgets/google_button_body.dart';
import 'package:note_app/features/auth/presentation/pages/login/widgets/login_button.dart';
import 'package:note_app/features/auth/presentation/pages/login/widgets/login_fields.dart';
import 'package:note_app/features/auth/presentation/pages/login/widgets/login_logo.dart';
import 'package:note_app/features/auth/presentation/pages/login/widgets/register_line.dart';
import 'package:note_app/features/auth/presentation/pages/login/widgets/sign_in_with_google.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
     return BlocConsumer<LoginCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          BlocProvider.of<LoginCubit>(context).isLoading = false;
          Navigator.pushReplacementNamed(context, PagesKeys.personalPageView);
        } else if (state is SignInErrorState) {
          BlocProvider.of<LoginCubit>(context).isLoading = false;
           AwesomeDialog(
      context: context,
      title: 'error',
      body: const Text('oops there was an error check internet connection and try again'),
    ).show();
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<LoginCubit>(context);
        return ModalProgressHUD(
          inAsyncCall: cubit.isLoading,
          child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(10* 1.3),
                child: CustomScrollView(
                  slivers: [
                    const LoginLogo(),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              signInWithGoogle(cubit, context);
                            },
                            child: const GoogleButtonBody(),
                          ),
                          const SizedBox(height: 20,),
                          LoginFields(cubit: cubit),
                          const SizedBox(height: 30,),
                          const RegisterLine(),
                          const SizedBox(height: 30,),
                          LoginButton(formKey: formKey, cubit: cubit),
                          const Expanded(child: SizedBox()),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}








