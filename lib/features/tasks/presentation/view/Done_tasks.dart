import 'package:flutter/material.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/all_tasks_app_bar.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/all_tasks_item.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/done_tasks_item.dart';

class DoneTasks extends StatelessWidget {
  const DoneTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AllTasksAppBar(title: 'Done Tasks'),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20,
          end: 20,
        ),
        child: CustomScrollView(
          slivers: [
            SliverList.builder(
              itemBuilder: (context, index) => const DoneTasksItem(),
              itemCount: 15,
            ),
          ],
        ),
      ),
    );
  }
}
