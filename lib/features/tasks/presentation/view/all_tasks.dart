import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/features/tasks/presentation/manager/task_operation_cubit.dart/task_operation_cubit.dart';
import 'package:note_app/features/tasks/presentation/manager/task_operation_cubit.dart/task_operation_state.dart';
import 'package:note_app/features/tasks/presentation/manager/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:note_app/features/tasks/presentation/manager/fetch_tasks_cubit/fetch_tasks_state.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/all_tasks_app_bar.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/all_tasks_item.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FetchTasksCubit()..fetchTasks(),
        child: BlocBuilder<FetchTasksCubit, FetchTasksState>(
          builder: (context, state) {
            var cubit = BlocProvider.of<FetchTasksCubit>(context);
            return ModalProgressHUD(
              inAsyncCall: state is FetchTasksLoadState,
              child: Scaffold(
                appBar: const AllTasksAppBar(
                  title: 'All Tasks',
                ),
                body: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 20,
                    end: 20,
                  ),
                  child: CustomScrollView(
                    slivers: [
                      TaskItemListView(cubit: cubit),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}

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
