import 'package:flutter/material.dart';
import 'package:note_app/features/tasks/data/model/menu_item.dart';
import 'package:note_app/features/tasks/home_main_page.dart';

class MenuItems {
  static const List<MenuItem> taskIconList = [
    MenuItem(title: 'Add Task', icon: Icons.add),
    MenuItem(title: 'All Tasks', icon: Icons.all_inbox_sharp),
    MenuItem(title: 'Finished Tasks', icon: Icons.done_outline),
  ];
}

class TaskHomePageMenu extends StatelessWidget {
  const TaskHomePageMenu(
      {super.key, required this.currentItem, required this.onSelectedItem});
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              ...MenuItems.taskIconList.map(buildItem).toList(),
              ListTile(
                title: Text('personal page'),
                leading: Icon(Icons.person),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeMainPage())),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItem(MenuItem menuItem) {
    return ListTileTheme(
      selectedColor: Colors.white,
      child: ListTile(
        selected: menuItem == currentItem,
        selectedTileColor: Colors.black26,
        title: FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(menuItem.title)),
        leading: Icon(menuItem.icon),
        onTap: () => onSelectedItem(menuItem),
      ),
    );
  }
}
