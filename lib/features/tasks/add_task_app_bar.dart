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
          title: Row(
            children: [
              const IgnoreTaskButton(),
              Flexible(
                  child: SizedBox(
                width: MediaQuery.sizeOf(context).width * .41 - 80,
              )),
              const Text(
                'Task',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontSize: ,
                ),
              ),
              const Expanded(child: SizedBox()),
              const SaveTaskButton(),
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



