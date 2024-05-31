import 'package:flutter/material.dart';
import 'package:note_app/core/widgets/custom_general_button.dart';
import 'package:note_app/features/auth/presentation/manager/register_cubit.dart';

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
