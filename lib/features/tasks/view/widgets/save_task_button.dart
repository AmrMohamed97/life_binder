import 'package:flutter/material.dart';

class SaveTaskButton extends StatelessWidget {
  const SaveTaskButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('save ',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
              )),
          Icon(
            Icons.add_task,
            color: Colors.blue,
            size: 20,
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
