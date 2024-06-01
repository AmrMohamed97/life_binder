 
import 'package:flutter/material.dart';

class CustomSlidingWidget extends StatefulWidget {
  const CustomSlidingWidget({super.key, required this.child, required this.x, required this.y});
  final Widget child;
  final double x, y;
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
    initSlidingAnimation(x: widget.x,y: widget.y,);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void initSlidingAnimation({required  double x,required double  y}) {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin:   Offset(x, y), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
