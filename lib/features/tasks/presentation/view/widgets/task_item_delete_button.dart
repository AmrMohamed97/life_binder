import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/constants/constances.dart';
import 'package:note_app/core/utiles/functions/custom_show_modal_popup.dart';
import 'package:note_app/core/utiles/functions/set_up.dart';
import 'package:note_app/core/widgets/local_notification_services.dart';
import 'package:note_app/features/tasks/data/model/task_model.dart';
import 'package:note_app/features/tasks/presentation/manager/task_operation_cubit.dart/task_operation_cubit.dart';
import 'package:note_app/features/tasks/presentation/manager/task_operation_cubit.dart/task_operation_state.dart';

class TaskItemDeleteButton extends StatelessWidget {
  const TaskItemDeleteButton({
    super.key,
    required this.item,
  });
  final TaskModel item;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskOperationCubit, TaskOperationState>(
        builder: (context, state) {
      var cubit = BlocProvider.of<TaskOperationCubit>(context);
      return GestureDetector(
        onTap: () {
          showBackDialog(
            message: 'Are you sure you want to delete this task?',
            title: 'delete',
            onPressed: () async {
              await getIt.get<LocalNotificationServices>().cancelNotification(
                    id: item.notificationId1!,
                  );
              await getIt.get<LocalNotificationServices>().cancelNotification(
                    id: item.notificationId2!,
                  );
              cubit.deleteTask(id: item.id!);
              navigatorKey.currentState?.pop();
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
