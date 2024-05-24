import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/constants/generated_images/generated_images.dart';
import 'package:note_app/core/utiles/functions/functions.dart';
import 'package:note_app/core/utiles/responsive/size_config.dart';
import 'package:note_app/core/widgets/custom_general_button.dart';
import 'package:note_app/core/widgets/custom_text_field.dart';
import 'package:note_app/features/auth/presentation/manager/auth_state.dart';
import 'package:note_app/features/auth/presentation/manager/login_cubit.dart';
import 'package:note_app/features/routes/pages_keys.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);
    return BlocConsumer<LoginCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          BlocProvider.of<LoginCubit>(context).isLoading = false;
          Navigator.pushReplacementNamed(context, PagesKeys.personalPageView);
        } else if (state is SignInErrorState) {
          BlocProvider.of<LoginCubit>(context).isLoading = false;
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<LoginCubit>(context);
        return ModalProgressHUD(
          inAsyncCall: cubit.isLoading,
          child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.all(sizeConfig.defaultSize * 1.3),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    verticalHeight(sizeConfig.height100),
                    Image.asset(
                      GeneratedImages.logoImg,
                      width: sizeConfig.defaultSize * 10,
                      height: sizeConfig.defaultSize * 10,
                    ),
                    verticalHeight(sizeConfig.height60),
                    GestureDetector(
                      onTap: () {
                        signInWithGoogle(cubit, context);
                      },
                      child: Container(
                        height: sizeConfig.height50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(sizeConfig.defaultSize),
                          border: Border.all(
                            color: AppColors.deepGray,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/google.png',
                              height: sizeConfig.defaultSize * 3,
                            ),
                            horizontalHeight(sizeConfig.defaultSize),
                            Text(
                              'Sign In With Google',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: sizeConfig.defaultSize * 1.54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalHeight(sizeConfig.height20),
                    CustomTextField(
                      onSaved: (val) {
                        cubit.email = val;
                      },
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'this field is required';
                        }
                        return null;
                      },
                      hintText: 'Email',
                      textInputType: TextInputType.name,
                      maxLines: 1,
                    ),
                    verticalHeight(sizeConfig.height20),
                    CustomTextField(
                      onSaved: (val) {
                        cubit.password = val;
                      },
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'this field is required';
                        }
                        return null;
                      },
                      hintText: 'Password',
                      textInputType: TextInputType.name,
                      maxLines: 1,
                    ),
                    verticalHeight(sizeConfig.height30),
                    Row(
                      children: [
                        const Text(
                          'If you haven\'t account',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                          ),
                        ),
                        CupertinoButton(
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.pushNamed(
                                context, PagesKeys.registerView);
                          },
                          child: const Text(
                            ' Click here',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                    verticalHeight(sizeConfig.height20),
                    CustomGeneralButton(
                      label: 'Login',
                      onTap: () async {
                        formKey.currentState!.save();
                        if (formKey.currentState!.validate()) {
                          await cubit.signIn(context);
                        }
                      },
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }

  void signInWithGoogle(LoginCubit cubit, BuildContext context) {
    cubit.changeLoadingState(state: true);
    cubit.signInWithGoogle().then((value) {
      cubit.changeLoadingState(state: false);
      Navigator.pushReplacementNamed(context, PagesKeys.personalPageView);
      cubit.addGoogleUser(
          userName: value.user?.displayName, email: value.user?.email);
    }).catchError((error) {
      cubit.changeLoadingState(state: false);
      print('=============================================');
      print(error.code.toString());
      print('=============================================');
      AwesomeDialog(
        context: context,
        title: 'error',
        body: Text(error.code.toString()),
      ).show();
    });
  }
}
