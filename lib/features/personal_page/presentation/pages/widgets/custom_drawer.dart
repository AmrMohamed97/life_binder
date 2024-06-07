import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/constants/constances.dart';
import 'package:note_app/core/routes/pages_keys.dart';
import 'package:note_app/core/utiles/functions/sign_out.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';
import 'package:note_app/features/tasks/presentation/view/task_home_page.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/ignore_task_button.dart';
import 'package:note_app/features/tasks/presentation/view/widgets/task_home_page_menu.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.cubit,
  });

  final PersonInfoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.7,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.blue,
              ),
              accountName: Text(
                '${cubit.userName}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                '${FirebaseAuth.instance.currentUser!.email}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(cubit.personalImage),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                ListTile(
                  onTap: () => Navigator.pushNamed(context, PagesKeys.addNotes),
                  leading: const Icon(Icons.add_comment),
                  title: const Text('add note'),
                ),
                ListTile(
                  onTap: () {
                    navigatorKey.currentState
                        ?.pushNamed(PagesKeys.taskHomePage);
                  },
                  leading: const Icon(Icons.add_task),
                  title: const Text('add task'),
                ),
                ListTile(
                  onTap: () async {
                    await Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) =>const TaskHmoePage(page: 1,) ));
                  },
                  leading: const Icon(Icons.task_alt),
                  title: const Text('Tasks Page'),
                ),
                const ListTile(
                  title:   Text('whatsapp'),
                  leading:  FaIcon(FontAwesomeIcons.whatsapp),
                ),
                const Expanded(
                    child: SizedBox(
                  height: 10,
                )),
                ListTile(
                  onTap: () async {
                    await signOut();
                  },
                  leading: const Icon(
                    Icons.exit_to_app,
                    color: AppColors.black,
                  ),
                  title: const Text('Sign Out'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
