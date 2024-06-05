 import 'package:flutter/material.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/tasks_item_content.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/tasks_item_date.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/tasks_item_header.dart';

class AllTasksItem extends StatelessWidget {
  const AllTasksItem({
    super.key,   this.category='all',
  });
  final String category;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsetsDirectional.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color(0xffF0D1A8),
      ),
      child:   Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TasksItemHeader(
            category: category,
          ),
          const SizedBox(
            height: 8,
          ),
          const TasksItemContent(),
          const SizedBox(
            height: 10,
          ),
          const TasksItemDate(
            date: 'dd/MM/yyyy',
            dateTitle: 'start date',
            time: '00:00',
          ),
          const TasksItemDate(
            date: 'dd/MM/yyyy',
            dateTitle: 'end date',
            time: '00:00',
          ),
        ],
      ),
    );
  }
}
