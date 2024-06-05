import 'package:flutter/widgets.dart';
import 'package:note_app/features/tasks/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/add_task_end_date_time.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/add_task_start_date_time.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/add_task_fields.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/add_task_header.dart';

class AddTaskBody extends StatelessWidget {
  const AddTaskBody({
    super.key, required this.cubit,
  });

  final AddTaskCubit cubit;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 37),
          const AddTaskHeader(),
          const SizedBox(
            height: 39,
          ),
          AddTaskFields(cubit: cubit,),
          const SizedBox(
            height: 30,
          ),
          AddTaskStartDateTime(
            cubit: cubit,
          ),
          const SizedBox(
            height: 20,
          ),
          AddTaskEndDateTime(
            cubit: cubit,
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
