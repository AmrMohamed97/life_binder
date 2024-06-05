import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/tasks/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:note_app/features/tasks/presentation/manager/add_task_cubit/add_task_state.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/add_task_app_bar.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/add_task_body.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: BlocBuilder<AddTaskCubit, AddTaskState>(
        builder: (context, state) {
          return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child:   Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: AddTaskAppBar()),
            SliverFillRemaining(
              hasScrollBody: false,
              child: AddTaskBody(cubit: BlocProvider.of<AddTaskCubit>(context),),
            ),
          ],
        ),
      ),
    );
        },
      )
    );
  }
}
