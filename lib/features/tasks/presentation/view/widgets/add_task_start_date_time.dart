import 'package:flutter/material.dart';
import 'package:note_app/features/tasks/presentation/manager/task_cubit/task_cubit.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/add_task_start_date.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/add_task_start_time.dart';

class AddTaskStartDateTime extends StatelessWidget {
  const AddTaskStartDateTime({
    super.key,
    required this.cubit,
  });
  final TaskCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AddTaskStartDate(
          cubit: cubit,
        ),
        const SizedBox(
          width: 20,
        ),
        AddTaskStartTime(
          cubit: cubit,
        ),
      ],
    );
  }
}
