import 'package:flutter/cupertino.dart';
import 'package:note_app/core/widgets/custom_text_field.dart';
import 'package:note_app/features/auth/presentation/manager/register_cubit.dart';

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
