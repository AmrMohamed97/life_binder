import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/features/tasks/view/widgets/all_tasks_app_bar.dart';
import 'package:note_app/features/tasks/view/widgets/all_tasks_item.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AllTasksAppBar(title: 'All Tasks',),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20,
          end: 20,
        ),
        child: CustomScrollView(
          slivers: [
            SliverList.builder(
              itemBuilder: (context, index) => const AllTasksItem(),
              itemCount: 15,
            ),
          ],
        ),
      ),
    );
  }
}
