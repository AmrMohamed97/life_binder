import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/tasks/presentation/manager/fetch_done_tasks_cubit/fetch_done_task_cubit.dart';
import 'package:note_app/features/tasks/presentation/manager/fetch_done_tasks_cubit/fetch_done_task_state.dart';
import 'package:note_app/features/tasks/presentation/manager/task_operation_cubit.dart/task_operation_cubit.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/all_tasks_app_bar.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/done_tasks_item.dart';

class DoneTasks extends StatelessWidget {
  const DoneTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FetchDoneTasksCubit()..fetchDoneTasks(),
        child: BlocBuilder<FetchDoneTasksCubit, FetchDoneTasksState>(
            builder: (context, state) {
          var cubit = BlocProvider.of<FetchDoneTasksCubit>(context);
          return Scaffold(
            appBar: const AllTasksAppBar(title: 'Done Tasks'),
            body: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 20,
                end: 20,
              ),
              child: CustomScrollView(
                slivers: [
                  DoneTasksListView(cubit: cubit),
                ],
              ),
            ),
          );
        }));
  }
}

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
    return SliverList.builder(
      itemBuilder: (context, index) => DoneTasksItem(
        item: cubit.doneTasksList[index],
      ),
      itemCount: cubit.doneTasksList.length,
    );
  }
}
