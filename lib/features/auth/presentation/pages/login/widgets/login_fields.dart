import 'package:flutter/material.dart';
import 'package:note_app/core/widgets/custom_text_field.dart';
import 'package:note_app/features/auth/presentation/manager/login_cubit.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({
    super.key,
    required this.cubit,
  });

  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        const SizedBox(height: 20,),
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
      ],
    );
  }
}
