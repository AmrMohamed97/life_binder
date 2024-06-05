import 'package:flutter/material.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/task_item_delete_button.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/task_item_done_button.dart';

class TasksItemHeader extends StatelessWidget {
  const TasksItemHeader({
    super.key,   this.category='all',
  });
  final String category;
  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Task',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Row(
          children: [
            const TaskItemDeleteButton(),
            const VerticalDivider(
              color: Colors.grey,
              width: 10,
              thickness: 6,
              endIndent: 0,
              indent: 0,
            ),
            if(category=='all')
            const TaskItemDoneButton(),
          ],
        ),
      ],
    );
  }
}
