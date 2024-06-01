import 'package:flutter/material.dart';
import 'package:note_app/core/constants/generated_images/generated_images.dart';
import 'package:note_app/core/widgets/custom_sliding_widget.dart';

class RegisterLogo extends StatelessWidget {
  const RegisterLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSlidingWidget(
      x: 5,
      y: 0,
      child: Image.asset(
        GeneratedImages.logoImg,
        width: 10 * 10,
        height: 10 * 10,
      ),
    );
  }
}
