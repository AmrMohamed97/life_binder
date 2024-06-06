import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/features/tasks/presentation/manager/task_cubit/task_cubit.dart';
import 'package:note_app/features/tasks/presentation/manager/task_cubit/task_state.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/add_task_app_bar.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/add_task_body.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TaskCubit(),
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: ModalProgressHUD(
                inAsyncCall: BlocProvider.of<TaskCubit>(context).isLoading,
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: CustomScrollView(
                    slivers: [
                      const SliverToBoxAdapter(child: AddTaskAppBar()),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: AddTaskBody(
                          cubit: BlocProvider.of<TaskCubit>(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
