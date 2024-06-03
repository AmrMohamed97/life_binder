import 'package:flutter/material.dart';

class AddTaskHeader extends StatelessWidget {
  const AddTaskHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Add a task',
      style: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
