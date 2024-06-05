import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';

class TaskItemDeleteButton extends StatelessWidget {
  const TaskItemDeleteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Card(
        color:   Color(0xffF0D1A8),
        child: Padding(
          padding:   EdgeInsets.all(5.0),
          child: Column(
            children: [
              Icon(
                Icons.delete,
                color: AppColors.red,
                size: 20,
              ),
              Text(
                'Delete',
                style: TextStyle(
                  fontSize: 11.5,
                  color: AppColors.red,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

