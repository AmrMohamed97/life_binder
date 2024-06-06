import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:note_app/features/tasks/presentation/view/add_task.dart';
import 'package:note_app/features/tasks/presentation/view/all_tasks.dart';
import 'package:note_app/features/tasks/data/model/menu_item.dart';
import 'package:note_app/features/tasks/data/model/menu_items.dart';
import 'package:note_app/features/tasks/presentation/view/Done_tasks.dart';
 import 'package:note_app/features/tasks/presentation/view/widgets/task_home_page_menu.dart';

class TaskHmoePage extends StatefulWidget {
  const TaskHmoePage({super.key});

  @override
  State<TaskHmoePage> createState() => _TaskHmoePageState();
}

class _TaskHmoePageState extends State<TaskHmoePage> {
  MenuItem currentItem = MenuItems.taskIconList[0];
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      borderRadius: 40,
      angle: -10,
      menuBackgroundColor: Colors.indigo,
      showShadow: true,
      slideWidth: MediaQuery.of(context).size.width * 0.68,
      shadowLayer2Color: const Color.fromARGB(186, 245, 175, 23),
      shadowLayer1Color: const Color.fromARGB(240, 71, 77, 75).withOpacity(.4),
      mainScreen: getScreen(),
      menuScreen: Builder(builder: (context) {
        return TaskHomePageMenu(
          currentItem: currentItem,
          onSelectedItem: (menuItem) {
            setState(() => currentItem = menuItem);
            ZoomDrawer.of(context)!.close();
          },
        );
      }),
    );
  }

  Widget getScreen() {
    return currentItem.title == 'Add Task'
        ? const AddTask()
        : currentItem.title == 'All Tasks'
            ? const AllTasks()
            : currentItem.title == 'Done Tasks'
                ? const DoneTasks()
                : const DoneTasks();
  }
}
