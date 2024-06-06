import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/constants/constances.dart';
import 'package:note_app/core/utiles/functions/set_up.dart';
import 'package:note_app/core/widgets/local_notification_services.dart';
import 'package:note_app/features/tasks/data/model/task_model.dart';
import 'package:note_app/features/tasks/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:note_app/features/tasks/presentation/manager/task_cubit/task_cubit.dart';
 import 'package:timezone/timezone.dart' as tz;

Future<void> addTaskMethod(
    TaskCubit taskCubit, AddTaskCubit cubit, BuildContext context)async {
  taskCubit.changeLoadingState(state: true);
     TaskModel task = TaskModel(
      taskName: taskCubit.taskNameController.text,
      taskContent: taskCubit.taskContentController.text,
      startDate: taskCubit.startDate,
      endDate: taskCubit.endDate,
      isDone: false,
    );
    var currentDate = tz.TZDateTime(
      tz.local,
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      DateTime.now().hour,
      DateTime.now().minute,
      DateTime.now().second,
      DateTime.now().millisecond,
      DateTime.now().microsecond,
    );

    if (taskCubit.taskNameController.text.isNotEmpty ||
        taskCubit.taskContentController.text.isNotEmpty) {
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
      id: id,
      title: 'Task start date',
      body: 'you should start: ${taskCubit.taskNameController.text.isEmpty?taskCubit.taskContentController.text:taskCubit.taskNameController.text}',
      scheduledDate: startDate,
    );
    await getIt.get<LocalNotificationServices>().sendScheduledNotification(
      id: id + 1,
      title: 'task deadline',
      body:'You must be finished: ${taskCubit.taskNameController.text.isEmpty?taskCubit.taskContentController.text:taskCubit.taskNameController.text}',
      scheduledDate: endDate,
    );
         

        } else {
          AwesomeDialog(
            context: context,
            title: 'error',
            body: const Text('enter correct date'),
          ).show();
          taskCubit.changeLoadingState(state: false);
          return;
        }
      } else {
        AwesomeDialog(
          context: context,
          title: 'error',
          body: const Text('add   date and   time'),
        ).show();
        taskCubit.changeLoadingState(state: false);
        return;
      }
    } else {
      AwesomeDialog(
        context: context,
        title: 'error',
        body: const Text('add task name or content'),
      ).show();
      taskCubit.changeLoadingState(state: false);
      return;
    }
  
  
}
