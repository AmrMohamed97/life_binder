import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/utiles/functions/set_up.dart';
import 'package:note_app/core/widgets/local_notification_services.dart';
import 'package:note_app/features/tasks/data/model/task_model.dart';
import 'package:note_app/features/tasks/presentation/manager/task_operation_cubit.dart/task_operation_cubit.dart';
import 'package:note_app/features/tasks/presentation/manager/task_operation_cubit.dart/task_operation_state.dart';

class TaskItemDoneButton extends StatelessWidget {
  const TaskItemDoneButton({
    super.key,
    this.item,
  });

  final TaskModel? item;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskOperationCubit, TaskOperationState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<TaskOperationCubit>(context);
      return GestureDetector(
        onTap: ()async {
          await getIt.get<LocalNotificationServices>().cancelNotification(id: item!.notificationId1!,);
              await getIt.get<LocalNotificationServices>().cancelNotification(id: item!.notificationId2!,);
          cubit.changeTaskState(id: item!.id!);
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
    });
  }
}
