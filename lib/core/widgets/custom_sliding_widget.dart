import 'package:flutter/material.dart';
 
class CustomSlidingWidget extends StatefulWidget {
  const CustomSlidingWidget({super.key, required this.child});
  final Widget child;

  @override
  State<CustomSlidingWidget> createState() => _CustomSlidingWidgetState();
}

class _CustomSlidingWidgetState extends State<CustomSlidingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
   }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 4), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

}
