import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/constants/generated_images/generated_images.dart';
import 'package:note_app/core/widgets/custom_general_button.dart';
import 'package:note_app/core/widgets/custom_text_field.dart';
 import 'package:note_app/features/auth/presentation/manager/auth_state.dart';
import 'package:note_app/core/routes/pages_keys.dart';
import 'package:note_app/features/auth/presentation/manager/register_cubit.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                padding:const  EdgeInsets.all(10 * 1.3),
                child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                             Flexible(child: SizedBox(height: 100,)),
                          RegisterLogo(),
                            Flexible(child: SizedBox(height: 60,)),
                        ],
                      ),
                    ),
                    SliverFillRemaining(
                      child: Column(
                        children: [
                          RegisterFields(cubit: cubit),
                          const SizedBox(height: 30,),
                          const LoginRow(),
                          const SizedBox(height: 20,),
                          RegisterButton(formKey: formKey, cubit: cubit),
                          const Expanded(child: SizedBox(height: 20,)),
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

class RegisterLogo extends StatelessWidget {
  const RegisterLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      GeneratedImages.logoImg,
      width: 10 * 10,
      height: 10 * 10,
    );
  }
}



class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.formKey,
    required this.cubit,
  });

  final GlobalKey<FormState> formKey;
  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomGeneralButton(
      label: 'Register',
      onTap: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          await cubit.register(context);
        }
      },
    );
  }
}

class LoginRow extends StatelessWidget {
  const LoginRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class RegisterFields extends StatelessWidget {
  const RegisterFields({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        const SizedBox(height: 20,),
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
        const SizedBox(height: 20,),
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
      ],
    );
  }
}
