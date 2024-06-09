import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/tasks/presentation/manager/fetch_done_tasks_cubit/fetch_done_task_cubit.dart';
import 'package:note_app/features/tasks/presentation/manager/task_operation_cubit.dart/task_operation_cubit.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/done_tasks_item.dart';

class DoneTasksListView extends StatelessWidget {
  const DoneTasksListView({
    super.key,
    required this.cubit,
  });

  final FetchDoneTasksCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskOperationCubit(),
      child: SliverList.builder(
      itemBuilder: (context, index) => DoneTasksItem(
        item: cubit.doneTasksList[index],
      ),
      itemCount: cubit.doneTasksList.length,
    ),
    );
     
  }
}
