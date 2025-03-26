import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:note_app/features/auth/presentation/manager/app_theme_cubit/app_theme_cubit.dart';
import 'package:note_app/features/tasks/presentation/view/add_task.dart';
import 'package:note_app/features/tasks/presentation/view/all_tasks.dart';
import 'package:note_app/features/tasks/data/model/menu_item.dart';
import 'package:note_app/features/tasks/data/model/menu_items.dart';
import 'package:note_app/features/tasks/presentation/view/all_done_tasks.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/task_home_page_menu.dart';

class TaskHmoePage extends StatefulWidget {
  const TaskHmoePage(
      {super.key, this.page = 0,required this.personalImage,required this.userName});
  final int page;
  final String personalImage, userName;
  @override
  State<TaskHmoePage> createState() => _TaskHmoePageState();
}

class _TaskHmoePageState extends State<TaskHmoePage> {
  late MenuItem currentItem;
  @override
  void initState() {
    currentItem = MenuItems.taskIconList[widget.page];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      borderRadius: 40,
      angle: -10,
      menuBackgroundColor: BlocProvider.of<AppThemeCubit>(context).isDark
          ? Colors.black
          : Colors.indigo,
      showShadow: true,
      slideWidth: MediaQuery.of(context).size.width * 0.68,
      shadowLayer2Color: const Color.fromARGB(186, 245, 175, 23),
      shadowLayer1Color: const Color.fromARGB(240, 71, 77, 75).withValues(alpha:  .4),
      mainScreen: getScreen(),
      menuScreen: Builder(builder: (context) {
        return TaskHomePageMenu(
          personalImage: widget.personalImage,
          userName: widget.userName ,
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
                ? const AllDoneTasks()
                : const AllDoneTasks();
  }
}
