import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/constants/generated_images/generated_images.dart';
import 'package:note_app/core/utiles/functions/functions.dart';
import 'package:note_app/core/utiles/responsive/size_config.dart';
import 'package:note_app/core/widgets/custom_general_button.dart';
import 'package:note_app/core/widgets/custom_text_field.dart';
import 'package:note_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:note_app/features/auth/presentation/manager/auth_state.dart';
import 'package:note_app/core/routes/pages_keys.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);
    return BlocConsumer<RegisterCubit, AuthState>(
      listener: (context, state) async {
        if (state is RegisterSuccessState) {
          BlocProvider.of<RegisterCubit>(context).isLoading = false;
          Navigator.pushNamed(context, PagesKeys.personalPageView);
          await BlocProvider.of<RegisterCubit>(context).addUser();
        } else if (state is RegisterErrorState) {
          BlocProvider.of<RegisterCubit>(context).isLoading = false;
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<RegisterCubit>(context);
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
                    CustomTextField(
                      onFieldSubmitted: (val) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      onSaved: (val) {
                        cubit.userName = val;
                      },
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'this field is required';
                        }
                        return null;
                      },
                      hintText: 'User Name',
                      textInputType: TextInputType.name,
                      maxLines: 1,
                    ),
                    verticalHeight(sizeConfig.height20),
                    CustomTextField(
                      onFieldSubmitted: (val) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
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
                      onFieldSubmitted: (val) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
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
                          'If you have account',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                          ),
                        ),
                        CupertinoButton(
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.pushNamed(context, PagesKeys.loginView);
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
                      label: 'Register',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          await cubit.register(context);
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
}
