import 'package:flutter/material.dart';
import 'package:note_app/core/widgets/custom_general_button.dart';
import 'package:note_app/core/widgets/custom_sliding_widget.dart';
import 'package:note_app/features/auth/presentation/manager/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.cubit,
  });

  final GlobalKey<FormState> formKey;
  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomSlidingWidget(
      x: 0,
      y: 5.8,
      child: CustomGeneralButton(
        label: 'Login',
        onTap: () async {
          formKey.currentState!.save();
          if (formKey.currentState!.validate()) {
            await cubit.signIn(context);
          }
        },
      ),
    );
  }
}
