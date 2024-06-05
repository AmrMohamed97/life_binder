import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/features/tasks/presentation/manager/add_task_cubit/add_task_cubit.dart';
 
class AddTaskStartDate extends StatelessWidget {
  const AddTaskStartDate({
    super.key,
    required this.cubit,
  });

  final AddTaskCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          const Text(
            'start date',
            style:   TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              showDatePicker(context: context,
               firstDate: DateTime.now(),
                lastDate: DateTime.parse('2030-12-30'),
              ).then((startDate) {
                if (startDate != null) {
                  cubit.assignStartDate(date: startDate);
                } else {
                  if (cubit.startDate == null) {
                    cubit.assignStartDate(date: startDate);
                  } else {
                    cubit.assignStartDate(date: cubit.startDate);
                  }
                }
              },);
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
                child: cubit.startDate != null?Text(
                  DateFormat('dd/MM/yyyy').format(cubit.startDate!),
                  style: const TextStyle(),
                ):const Text('dd/MM/yyyy',style: TextStyle(),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
