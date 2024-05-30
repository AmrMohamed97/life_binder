import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
 
void showSnakBar({
  required BuildContext context,
  String? title,
  required String message,
   Color? backgroundColor,
  Color? titleColor,
}) {
  AnimatedSnackBar(
      animationDuration: const Duration(milliseconds: 500),
      builder: (context) => Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.grey,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                const Flexible(child: SizedBox(width: 12)),
                Expanded(
                    child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 14,
                    color: titleColor ?? const Color(0xFF161626),
                  ),
                )),
              ],
            ),
          )).show(
    context,
  );
}
