import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/tasks/data/model/task_model.dart';
import 'package:note_app/features/tasks/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:note_app/features/tasks/presentation/manager/add_task_cubit/add_task_state.dart';
import 'package:note_app/features/tasks/presentation/manager/task_cubit/task_cubit.dart';
import 'package:timezone/timezone.dart' as tz;

class SaveTaskButton extends StatelessWidget {
  const SaveTaskButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: BlocBuilder<AddTaskCubit, AddTaskState>(
        builder: (context, state) {
          var taskCubit = BlocProvider.of<TaskCubit>(context);
          var cubit = BlocProvider.of<AddTaskCubit>(context);
          return GestureDetector(
            onTap: () {
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
                  if (currentDate.isBefore(startDate) &&
                      startDate.isBefore(endDate)) {
                    cubit.addTask(task);
                  } else {
                    print('======================');
                    print('enter correct date');
                  }
                } else {
                  print('==========================');
                  print('add   date and   time');
                }
              } else {
                print( '==============================');
                print( 'add task name or content');
              }
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('save ',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    )),
                Icon(
                  Icons.add_task,
                  color: Colors.blue,
                  size: 20,
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
