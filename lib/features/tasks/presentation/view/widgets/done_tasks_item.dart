 import 'package:flutter/material.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/tasks_item_content.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/tasks_item_date.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/tasks_item_header.dart';

class DoneTasksItem extends StatelessWidget {
  const DoneTasksItem({
    super.key,
    //  required this.item,   
  });
  // final TaskModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsetsDirectional.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color(0xffF0D1A8),
      ),
      child:  const  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TasksItemHeader(category: 'done',taskTitle: 'task',id: '1',),
            SizedBox(
            height: 8,
          ),
            TasksItemContent(content: 'content',),
            SizedBox(
            height: 10,
          ),
            TasksItemDate(
            date: 'dd/MM/yyyy',
            dateTitle: 'start date',
            time: '00:00',
          ),
            TasksItemDate(
            date: 'dd/MM/yyyy',
            dateTitle: 'end date',
            time: '00:00',
          ),
        ],
      ),
    );
  }
}
