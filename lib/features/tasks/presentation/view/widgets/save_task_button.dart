 import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:note_app/core/constants/constances.dart';
import 'package:note_app/core/utiles/functions/custom_snack_bar.dart';
import 'package:note_app/features/tasks/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:note_app/features/tasks/presentation/manager/add_task_cubit/add_task_state.dart';
import 'package:note_app/features/tasks/presentation/manager/task_cubit/task_cubit.dart';
import 'package:note_app/features/tasks/presentation/view/all_tasks.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/add_task_method.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/assign_initial_values.dart';

class SaveTaskButton extends StatelessWidget {
  const SaveTaskButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: BlocConsumer<AddTaskCubit, AddTaskState>(
        listener: (context, state) async {
          if (state is AddTaskError) {
            AwesomeDialog(
              context: context,
              title: 'error',
              body: const Text(
                  'oops there was an error check internet connection and try again'),
            ).show();
          } else if (state is AddTaskSuccess) {
            BlocProvider.of<TaskCubit>(context)
                .changeLoadingState(state: false);
            // navigatorKey.currentState
            //     ?.pushReplacement(MaterialPageRoute(builder: (_) => const AllTasks()));
            ZoomDrawer.of(context)?.toggle();
//----------------------------------------------------------------------
            assignInitialValues(context);
            id=id + 2;
            debugPrint(
                '=========================================================');
            debugPrint(id.toString());
            showSnakBar(context: context, message: 'Task Added Successfully');
          }
        },
        builder: (context, state) {
          var taskCubit = BlocProvider.of<TaskCubit>(context);
          var cubit = BlocProvider.of<AddTaskCubit>(context);
          return GestureDetector(
            onTap: () async {
              await addTaskMethod(taskCubit, cubit, context);
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
