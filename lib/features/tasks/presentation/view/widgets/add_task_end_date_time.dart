import 'package:flutter/widgets.dart';
import 'package:note_app/features/tasks/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/add_task_end_date.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/add_task_end_time.dart';

class AddTaskEndDateTime extends StatelessWidget {
  const AddTaskEndDateTime({
    super.key,
    required this.cubit,
  });
  final AddTaskCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AddTaskEndDate(cubit: cubit,),
        const SizedBox(
          width: 20,
        ),
        AddTaskEndTime(cubit: cubit,),
      ],
    );
  }
}
