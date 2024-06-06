import 'package:flutter/material.dart';

class TasksItemDate extends StatelessWidget {
  const TasksItemDate({
    super.key,
    required this.dateTitle,
    required this.date,
    required this.time,
  });
  final String dateTitle, date, time;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$dateTitle :  $date',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          Card(
            // color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                time,
                style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
