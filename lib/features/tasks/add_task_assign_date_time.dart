import 'package:flutter/material.dart';

class AddTaskStartDate extends StatelessWidget {
  const AddTaskStartDate({
    super.key,
    required this.dateTitle,
    required this.timeTitle,
    required this.date,
    required this.time,
  });
  final String dateTitle, timeTitle, date, time;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Text(
                dateTitle,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                child: Center(
                  child: Text(
                    date,
                    style: TextStyle(),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                timeTitle,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                child: Center(
                  child: Text(
                    time,
                    style: TextStyle(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
