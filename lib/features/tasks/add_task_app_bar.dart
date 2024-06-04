import 'package:flutter/material.dart';
import 'package:note_app/features/tasks/ignore_task_button.dart';
import 'package:note_app/features/tasks/save_task_button.dart';

class AddTaskAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddTaskAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const Row(
            children: [
              IgnoreTaskButton(),
              Expanded(child: SizedBox()),
              Text(
                'Task',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontSize: ,
                ),
              ),
              Expanded(child: SizedBox()),
              SaveTaskButton(),
            ],
          ),
        ),
        const Divider(
          height: 2,
          thickness: 2,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
