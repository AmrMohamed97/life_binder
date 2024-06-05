import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';

class TaskItemDoneButton extends StatelessWidget {
  const TaskItemDoneButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Card(
        color: Color(0xffF0D1A8),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
          child: Column(
            children: [
              Icon(
                Icons.done_outline_sharp,
                color: AppColors.blue,
                size: 18,
              ),
              Text(
                'Done',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.blue,
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
