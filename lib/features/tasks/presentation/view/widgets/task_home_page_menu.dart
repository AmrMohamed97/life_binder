import 'package:flutter/material.dart';
import 'package:note_app/core/routes/pages_keys.dart';
import 'package:note_app/features/tasks/data/model/menu_item.dart';
import 'package:note_app/features/tasks/data/model/menu_items.dart';
 
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
              // const Spacer(),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsetsDirectional.only(start: 25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FittedBox(
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Amr elzorkany',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
                ListTile(
                title:   const FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.scaleDown,
                    child: Text('personal page')),
                leading:  const Icon(Icons.person),
                onTap: () {
                  Navigator.pushReplacementNamed(context, PagesKeys.personalPageView);
                },
              ),
              ...MenuItems.taskIconList.map(buildItem).toList(),

              const Spacer(
                flex: 4,
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
