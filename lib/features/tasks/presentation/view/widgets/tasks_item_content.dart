import 'package:flutter/material.dart';

class TasksItemContent extends StatelessWidget {
  const TasksItemContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Task body 555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.grey,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}