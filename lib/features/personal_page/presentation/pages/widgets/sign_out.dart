import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/constants/constances.dart';
import 'package:note_app/features/routes/pages_keys.dart';

class SignOut extends StatelessWidget {
  const SignOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 10),
      child: IconButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut().then((value) {
            navigatorKey.currentState
                ?.pushReplacementNamed(PagesKeys.loginView);
          });
        },
        icon: const Icon(
          Icons.exit_to_app,
          color: AppColors.black,
        ),
      ),
    );
  }
}