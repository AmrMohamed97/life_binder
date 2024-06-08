import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/utiles/functions/custom_show_modal_popup.dart';
import 'package:note_app/features/tasks/presentation/manager/task_operation_cubit.dart/task_operation_cubit.dart';
import 'package:note_app/features/tasks/presentation/manager/task_operation_cubit.dart/task_operation_state.dart';

class TaskItemDeleteButton extends StatelessWidget {
  const TaskItemDeleteButton({
    super.key,
    required this.id,
  });
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskOperationCubit, TaskOperationState>(
        builder: (context, state) {
      return GestureDetector(
        onTap: () {
          showBackDialog(
            message: 'Are you sure you want to delete this task?',
            title: 'delete',
            onPressed: () {
              BlocProvider.of<TaskOperationCubit>(context).deleteTask(id: id);
              Navigator.pop(context);
            },
            context: context,
          );
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
    });
  }
}
