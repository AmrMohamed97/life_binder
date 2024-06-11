import 'package:flutter/material.dart';
import 'package:note_app/core/routes/pages_keys.dart';
import 'package:note_app/core/utiles/pages.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';
import 'package:note_app/features/tasks/presentation/view/task_home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalPageMenuItem extends StatelessWidget {
  const PersonalPageMenuItem({
    super.key, required this.cubit,
  });
final PersonInfoCubit cubit;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: const Icon(Icons.more_horiz),
        position: PopupMenuPosition.under,
        onSelected: (value) async{
          switch (value) {
            case Pages.addNote:
              Navigator.pushNamed(context, PagesKeys.addNotes);
              break;  //add note

            case Pages.addTask: 
              Navigator.of(context)
                .pushReplacement(MaterialPageRoute(
                    builder: (context) => TaskHmoePage(
                          personalImage: cubit.personalImage,
                          userName: cubit.userName!,
                        )));
              break;  //add task

            case Pages.tasksPage:
             Navigator.of(context)
                .pushReplacement(MaterialPageRoute(
                    builder: (context) => TaskHmoePage(
                          page: 1,
                          personalImage: cubit.personalImage,
                          userName: cubit.userName!,
                        )));
              break;  //task page

            case Pages.whatsApp:
              Uri uri = Uri.parse('https://wa.me/?text= ');
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
              break;  //whatsApp
          }
        },
        itemBuilder: (_) {
          return [
            const PopupMenuItem(
              value: Pages.addNote,
              child: Text(' +  add note '),
            ),
            const PopupMenuItem(
              value: Pages.addTask,
              child: Text(' +  add task '),
            ),
            const PopupMenuItem(
              value: Pages.tasksPage,
              child: Text(' task page '),
            ),
            const PopupMenuItem(
              value: Pages.whatsApp,
              child: Text(' whatsApp '),
            ),
          ];
        });
  }
}
