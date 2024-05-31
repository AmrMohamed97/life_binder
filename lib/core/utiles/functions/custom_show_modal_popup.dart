import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showBackDialog(
    {required String message,
    required String title,
    required void Function()? onPressed,
    required BuildContext context}) {
  showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      content: Text(
        message,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          child: const Text(
            'cancel',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        CupertinoDialogAction(
          onPressed:  onPressed,
          child: const Text(
            'Confirm',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ),
  );
}
