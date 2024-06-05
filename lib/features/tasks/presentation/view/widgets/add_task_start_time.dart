import 'package:flutter/material.dart';
import 'package:note_app/features/tasks/presentation/manager/add_task_cubit/add_task_cubit.dart';

class AddTaskStartTime extends StatelessWidget {
  const AddTaskStartTime({
    super.key,
    required this.cubit,
  });

  final AddTaskCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Text(
            'start time',
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
                ).then((startTime) {
                  if(startTime != null){
                    cubit.assignStartTime(time: startTime);
                  }else{
                    if(cubit.startTime == null){
                      cubit.assignStartTime(time: startTime);
                    }else{
                      cubit.assignStartTime(time: cubit.startTime);
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
                  cubit.startTime?.format(context) ?? '--:-- AM',
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
