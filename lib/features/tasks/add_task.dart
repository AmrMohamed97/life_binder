import 'package:flutter/material.dart';
import 'package:note_app/features/tasks/add_task_app_bar.dart';
  import 'package:note_app/features/tasks/add_task_fields.dart';
import 'package:note_app/features/tasks/add_task_header.dart';
import 'package:note_app/features/tasks/add_task_assign_date_time.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: AddTaskAppBar()),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 29.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 37),
                  AddTaskHeader(),
                  SizedBox(
                    height: 39,
                  ),
                  AddTaskFields(),
                  SizedBox(
                    height: 30,
                  ),
                  AddTaskStartDate(
                    date: 'dd/MM/yyyy',
                    time: '00:00',
                    dateTitle: 'start date',
                    timeTitle: 'start time',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AddTaskStartDate(
                    date: 'dd/MM/yyyy',
                    time: '00:00',
                    dateTitle: 'end date',
                    timeTitle: 'end time',
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
