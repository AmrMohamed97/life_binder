import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/widgets/custom_text_field.dart';
import 'package:note_app/features/tasks/presentation/manager/add_task_cubit/add_task_cubit.dart';

class AddTaskFields extends StatelessWidget {
  const AddTaskFields({
    super.key, required this.cubit,
  });
  final AddTaskCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: [
            const Text(
              'Name ',
              style: TextStyle(
                fontSize: 23,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: CustomTextField(
                controller: cubit.taskNameController,
                maxLines: 1,
                textInputType: TextInputType.text,
                // controller: ,
                inputDecoration: const InputDecoration(hintText: ' task name'),
                hintStyle: const TextStyle(
                  color: Colors.red,
                ),
                textStyle: const TextStyle(color: Colors.deepPurple),
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                maxLength: 30,
                counter: const Text('30'),
              ),
            ),
          ],
        ),
        const Text(
          'Task ',
          style: TextStyle(
            fontSize: 23,
          ),
        ),
        CustomTextField(
          controller:cubit.taskContentController ,
          textInputType: TextInputType.multiline,
          maxLines: 4,
          textStyle: const TextStyle(color: Colors.deepPurple),
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          maxLength: 150,
          inputDecoration: InputDecoration(
            hintText: 'task',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.grey,
                )),
          ),
          counter: const Text('150'),
        ),
      ],
    );
  }
}
