import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
 import 'package:note_app/core/utiles/cache_helper.dart';
import 'package:note_app/core/utiles/functions/set_up.dart';
import 'package:note_app/core/widgets/local_notification_services.dart';
import 'package:note_app/features/tasks/data/model/task_model.dart';
import 'package:note_app/features/tasks/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:note_app/features/tasks/presentation/manager/task_cubit/task_cubit.dart';
import 'package:timezone/timezone.dart' as tz;

Future<void> checkTaskInputValidate(
    TaskCubit taskCubit,
    tz.TZDateTime currentDate,
    AddTaskCubit cubit,
    TaskModel task,
    BuildContext context) async {
  if (taskCubit.startDate != null &&
      taskCubit.endDate != null &&
      taskCubit.startTime != null &&
      taskCubit.endTime != null) {
    var startDate = tz.TZDateTime(
      tz.local,
      taskCubit.startDate!.year,
      taskCubit.startDate!.month,
      taskCubit.startDate!.day,
      taskCubit.startTime!.hour,
      taskCubit.startTime!.minute,
    );
    var endDate = tz.TZDateTime(
      tz.local,
      taskCubit.endDate!.year,
      taskCubit.endDate!.month,
      taskCubit.endDate!.day,
      taskCubit.endTime!.hour,
      taskCubit.endTime!.minute,
    );
    if (currentDate.isBefore(startDate) && startDate.isBefore(endDate)) {
      cubit.addTask(task);
      //------add Notifications-------
      await getIt.get<LocalNotificationServices>().sendScheduledNotification(
            id: await getIt.get<CacheHelper>().getData(key: 'notificationId'),
            title: 'Task start date',
            body:
                'you should start: ${taskCubit.taskNameController.text.isEmpty ? taskCubit.taskContentController.text : taskCubit.taskNameController.text}',
            scheduledDate: startDate,
          );
      await getIt.get<LocalNotificationServices>().sendScheduledNotification(
            id: await getIt.get<CacheHelper>().getData(key: 'notificationId') +
                1,
            title: 'task deadline',
            body:
                'You must be finished: ${taskCubit.taskNameController.text.isEmpty ? taskCubit.taskContentController.text : taskCubit.taskNameController.text}',
            scheduledDate: endDate,
          );
     await getIt.get<CacheHelper>().saveData(key: 'notificationId', value: await getIt.get<CacheHelper>().getData(key: 'notificationId')+2);
    } else {
      AwesomeDialog(
        context: context,
        title: 'error',
        body: const Text('enter correct date'),
      ).show();
      taskCubit.changeLoadingState(state: false);
    }
  } else {
    AwesomeDialog(
      context: context,
      title: 'error',
      body: const Text('add   date and   time'),
    ).show();
    taskCubit.changeLoadingState(state: false);
  }
}
