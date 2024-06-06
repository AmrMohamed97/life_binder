import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/constants/constances.dart';
import 'package:note_app/features/tasks/presentation/manager/delete_task_cubit.dart/delete_task_cubit.dart';
import 'package:note_app/features/tasks/presentation/manager/delete_task_cubit.dart/delete_task_state.dart';
import 'package:note_app/features/tasks/presentation/view/all_tasks.dart';

class TaskItemDeleteButton extends StatelessWidget {
  const TaskItemDeleteButton({
    super.key,
    required this.id,
  });
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DeleteTaskCubit(),
        child: BlocBuilder<DeleteTaskCubit, DeleteTaskState>(
            builder: (context, state) {
          return GestureDetector(
            onTap: () {
              BlocProvider.of<DeleteTaskCubit>(context).deleteTask(id: id);
              navigatorKey.currentState?.pushReplacement(MaterialPageRoute(builder: (context) => const AllTasks()));
            },
            child: const Card(
              color: Color(0xffF0D1A8),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.delete,
                      color: AppColors.red,
                      size: 20,
                    ),
                    Text(
                      'Delete',
                      style: TextStyle(
                        fontSize: 11.5,
                        color: AppColors.red,
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
