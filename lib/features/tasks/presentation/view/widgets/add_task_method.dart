import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
 import 'package:flutter/material.dart';
 import 'package:note_app/features/tasks/data/model/task_model.dart';
import 'package:note_app/features/tasks/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:note_app/features/tasks/presentation/manager/task_cubit/task_cubit.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/check_task_input_validate.dart';
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
      endTime: taskCubit.endTime?.format(context),
      startTime: taskCubit.startTime?.format(context),
      uid: FirebaseAuth.instance.currentUser!.uid,
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
      await checkTaskInputValidate(taskCubit, currentDate, cubit, task, context);
      
    } else {
      AwesomeDialog(
        context: context,
        title: 'error',
        body: const Text('add task name or content'),
      ).show();
      taskCubit.changeLoadingState(state: false);
     }
}

