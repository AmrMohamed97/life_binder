import 'package:flutter/material.dart';
import 'package:note_app/core/constants/generated_images/generated_images.dart';

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
