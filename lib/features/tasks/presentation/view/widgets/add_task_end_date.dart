import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/features/tasks/presentation/manager/task_cubit/task_cubit.dart';

class AddTaskEndDate extends StatelessWidget {
  const AddTaskEndDate({
    super.key,
    required this.cubit,
  });

  final TaskCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          const Text(
            'end date',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              try {
                await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.parse('2030-12-30'),
                ).then((endDate) {
                  if (endDate != null) {
                    cubit.assignEndDate(date: endDate);
                  } else {
                    if (cubit.endDate == null) {
                      cubit.assignEndDate(date: endDate);
                    } else {
                      cubit.assignEndDate(date: cubit.endDate);
                    }
                  }
                });
              } catch (error) {debugPrint(error.toString());}
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              child: Center(
                child: cubit.endDate != null
                    ? Text(
                        DateFormat('dd/MM/yyyy').format(cubit.endDate!),
                        style: const TextStyle(
                          color: Colors.deepPurple,
                        ),
                      )
                    : Text(
                        'dd/MM/yyyy',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
