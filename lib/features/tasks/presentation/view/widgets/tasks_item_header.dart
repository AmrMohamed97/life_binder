import 'package:flutter/material.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/task_item_delete_button.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/task_item_done_button.dart';

class TasksItemHeader extends StatelessWidget {
  const TasksItemHeader({
    super.key,
    this.category = 'all', required this.taskTitle, required  this.id,
  });
  final String category;
  final String taskTitle;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          Text(
          taskTitle,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Row(
          children: [
            TaskItemDeleteButton(id: id,),
            const VerticalDivider(
              color: Colors.grey,
              width: 10,
              thickness: 6,
              endIndent: 0,
              indent: 0,
            ),
            if (category == 'all')   TaskItemDoneButton(id: id,),
          ],
        ),
      ],
    );
  }
}
