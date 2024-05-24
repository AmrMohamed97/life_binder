import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showSnakBar({
  required BuildContext context,
  String? title,
  required String message,
  required String iconPath,
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
                SvgPicture.asset(
                  iconPath,
                  height: 18,
                  width: 18,
                ),
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
