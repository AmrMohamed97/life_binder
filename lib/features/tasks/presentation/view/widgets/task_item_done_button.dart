import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/constants/constances.dart';
import 'package:note_app/features/tasks/presentation/manager/change_task_state_cubit/change_task_state_cubit.dart';
import 'package:note_app/features/tasks/presentation/manager/change_task_state_cubit/change_task_state_state.dart';
 import 'package:note_app/features/tasks/presentation/view/all_tasks.dart';

class TaskItemDoneButton extends StatelessWidget {
  const TaskItemDoneButton({
    super.key,   this.id,
  });

  final String? id ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ChangeTaskStateCubit(),
        child: BlocBuilder<ChangeTaskStateCubit, ChangeTaskStateState>(
            builder: (context, state) {
          return GestureDetector(
            onTap: () {
              BlocProvider.of<ChangeTaskStateCubit>(context).changeTaskState(id: id!);
            },
            child: const Card(
              color: Color(0xffF0D1A8),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                child: Column(
                  children: [
                    Icon(
                      Icons.done_outline_sharp,
                      color: AppColors.blue,
                      size: 18,
                    ),
                    Text(
                      'Done',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.blue,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
