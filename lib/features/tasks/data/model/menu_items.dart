import 'package:flutter/material.dart';
import 'package:note_app/features/tasks/data/model/menu_item.dart';

class MenuItems {
  static const List<MenuItem> taskIconList = [
    MenuItem(title: 'Add Task', icon: Icons.add),
    MenuItem(title: 'All Tasks', icon: Icons.all_inbox_sharp),
    MenuItem(title: 'Finished Tasks', icon: Icons.done_outline),
  ];
}