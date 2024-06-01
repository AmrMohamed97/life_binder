import 'package:flutter/material.dart';
import 'package:note_app/core/constants/generated_images/generated_images.dart';
import 'package:note_app/core/widgets/custom_sliding_widget.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomSlidingWidget(
        x: 0,
        y: -4.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Flexible(
                child: SizedBox(
              height: 100,
            )),
            Image.asset(
              GeneratedImages.logoImg,
              width: 10 * 10,
              height: 10 * 10,
            ),
            const Flexible(
                child: SizedBox(
              height: 60,
            )),
          ],
        ),
      ),
    );
  }
}
