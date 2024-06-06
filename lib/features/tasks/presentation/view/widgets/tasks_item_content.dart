import 'package:flutter/material.dart';

class TasksItemContent extends StatelessWidget {
  const TasksItemContent({
    super.key, required this.content,
  });
  final String content;

  @override
  Widget build(BuildContext context) {
    return   Text(
      content,
       style:const  TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.grey,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
