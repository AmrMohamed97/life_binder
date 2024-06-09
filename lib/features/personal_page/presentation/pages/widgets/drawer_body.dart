import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/routes/pages_keys.dart';
import 'package:note_app/core/utiles/functions/sign_out.dart';
import 'package:note_app/features/auth/presentation/manager/app_theme_cubit/app_theme_cubit.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';
import 'package:note_app/features/tasks/presentation/view/task_home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({
    super.key,
    required this.cubit,
  });

  final PersonInfoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () =>
              Navigator.pushNamed(context, PagesKeys.addNotes),
          leading: const Icon(Icons.add_comment),
          title: const Text('add note'),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(
                    builder: (context) => TaskHmoePage(
                          personalImage: cubit.personalImage,
                          userName: cubit.userName,
                        )));
          },
          leading: const Icon(Icons.add_task),
          title: const Text('add task'),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(
                    builder: (context) => TaskHmoePage(
                          page: 1,
                          personalImage: cubit.personalImage,
                          userName: cubit.userName,
                        )));
          },
          leading: const Icon(Icons.task_alt),
          title: const Text('Tasks Page'),
        ),
        ListTile(
          title: const Text('Whatsapp'),
          leading: const Icon(FontAwesomeIcons.whatsapp),
          onTap: () async {
            Uri uri = Uri.parse('https://wa.me/?text= ');
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          },
        ),
        ListTile(
          title: const Text('Call'),
          leading: const Icon(
            FontAwesomeIcons.phone,
            size: 20,
          ),
          onTap: () async {
            Uri uri = Uri.parse('tel:');
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          },
        ),
        ListTile(
          onTap: () async {
            await BlocProvider.of<AppThemeCubit>(context)
                .changeTheme();
          },
          leading: BlocProvider.of<AppThemeCubit>(context).isDark
              ? const Icon(Icons.light_mode)
              : const Icon(
                  Icons.dark_mode,
                ),
          title: BlocProvider.of<AppThemeCubit>(context).isDark
              ? const Text('Light mode')
              : const Text('Dark mode'),
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
          ),
          title: const Text('Sign Out'),
        ),
      ],
    );
  }
}