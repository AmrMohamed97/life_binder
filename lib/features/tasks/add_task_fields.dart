import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/core/widgets/custom_text_field.dart';

class AddTaskFields extends StatelessWidget {
  const AddTaskFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: [
            Text(
              'Name ',
              style: TextStyle(
                fontSize: 23,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: CustomTextField(
                maxLines: 1,
                textInputType: TextInputType.text,
                // controller: ,
                inputDecoration: InputDecoration(hintText: ' task name'),
                hintStyle: TextStyle(
                  color: Colors.red,
                ),
                textStyle: TextStyle(color: Colors.deepPurple),
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                maxLength: 30,
                counter: Text('30'),
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
