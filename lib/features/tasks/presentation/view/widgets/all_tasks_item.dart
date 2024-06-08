import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/features/tasks/data/model/task_model.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/tasks_item_content.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/tasks_item_date.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/tasks_item_header.dart';

class AllTasksItem extends StatelessWidget {
  const AllTasksItem({
    super.key,
    required this.item,
  });
  final TaskModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsetsDirectional.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color(0xffF0D1A8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TasksItemHeader(
            taskTitle: item.taskName.isEmpty ? 'task' : item.taskName,
            item: item,
          ),
          const SizedBox(
            height: 8,
          ),
          TasksItemContent(
            content:
                item.taskContent.isEmpty ? item.taskName : item.taskContent,
          ),
          const SizedBox(
            height: 10,
          ),
          TasksItemDate(
            date: DateFormat('dd/MM/yyyy').format(item.startDate!),
            dateTitle: 'start date',
            time: item.startTime,
          ),
          TasksItemDate(
            date: DateFormat('dd/MM/yyyy').format(item.endDate!),
            dateTitle: 'end date ',
            time: item.endTime,
          ),
        ],
      ),
    );
  }
}
