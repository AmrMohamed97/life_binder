import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/tasks/presentation/manager/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:note_app/features/tasks/presentation/manager/task_operation_cubit.dart/task_operation_cubit.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/all_tasks_item.dart';

class TaskItemListView extends StatelessWidget {
  const TaskItemListView({
    super.key,
    required this.cubit,
  });

  final FetchTasksCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TaskOperationCubit(),
        child: SliverList.builder(
          itemBuilder: (context, index) => AllTasksItem(
            item: cubit.tasksList[index],
          ),
          itemCount: cubit.tasksList.length,
        ),
    );
  }
}
