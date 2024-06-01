import 'package:flutter/material.dart';

class PersonalPageMenuItem extends StatelessWidget {
  const PersonalPageMenuItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: const Icon(Icons.more_horiz),
        position: PopupMenuPosition.under,
        onSelected: (value) {},
        itemBuilder: (Context) {
          return [
            const PopupMenuItem(
              value: 1,
              child: Text(' +  add note '),
            ),
            const PopupMenuItem(
              value: 2,
              child: Text(' +  add task '),
            ),
            const PopupMenuItem(
              value: 3,
              child: Text(' task page '),
            ),
            const PopupMenuItem(
              value: 4,
              child: Text(' whatsApp '),
            ),
          ];
        });
  }
}
