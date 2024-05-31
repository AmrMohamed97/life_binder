import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';

class GoogleButtonBody extends StatelessWidget {
  const GoogleButtonBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.deepGray,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/google.png',
            height: 30,
          ),
          const SizedBox(width: 10),
          const Text(
            'Sign In With Google',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.4,
            ),
          ),
        ],
      ),
    );
  }
}