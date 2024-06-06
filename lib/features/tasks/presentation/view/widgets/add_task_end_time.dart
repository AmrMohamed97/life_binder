import 'package:flutter/material.dart';
import 'package:note_app/features/tasks/presentation/manager/task_cubit/task_cubit.dart';

class AddTaskEndTime extends StatelessWidget {
  const AddTaskEndTime({
    super.key,
    required this.cubit,
  });

  final TaskCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Text(
            'End time',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then((value) {
                if (value != null) {
                  cubit.assignEndTime(time: value);
                } else {
                  if (cubit.endTime == null) {
                    cubit.assignEndTime(time: value);
                  } else {
                    cubit.assignEndTime(time: cubit.endTime);
                  }
                }
              });
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
                child: Text(
                  cubit.endTime?.format(context) ?? '--:-- AM',
                  style: const TextStyle(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
