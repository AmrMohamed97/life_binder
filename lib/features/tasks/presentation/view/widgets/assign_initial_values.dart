 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/tasks/presentation/manager/task_cubit/task_cubit.dart';

void assignInitialValues(BuildContext context) {
    BlocProvider.of<TaskCubit>(context).endDate = null;
    BlocProvider.of<TaskCubit>(context).endTime = null;
    BlocProvider.of<TaskCubit>(context).startDate = null;
    BlocProvider.of<TaskCubit>(context).startTime = null;
    BlocProvider.of<TaskCubit>(context).taskContentController.text = '';
    BlocProvider.of<TaskCubit>(context).taskNameController.text = '';
  }