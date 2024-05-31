import 'package:flutter/cupertino.dart';
 import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/routes/pages_keys.dart';

class RegisterLine extends StatelessWidget {
  const RegisterLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}