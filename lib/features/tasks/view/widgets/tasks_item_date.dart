import 'package:flutter/material.dart';

class TasksItemDate extends StatelessWidget {
  const TasksItemDate({
    super.key, required this.dateTitle, required this.date, required this.time,
  });
final String dateTitle, date, time;
  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            '$dateTitle :  $date',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
          Card(
          // color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                 time ,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
