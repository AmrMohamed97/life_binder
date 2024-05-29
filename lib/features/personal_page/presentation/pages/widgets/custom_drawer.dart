import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/routes/pages_keys.dart';
import 'package:note_app/core/utiles/functions/sign_out.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';

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
                const ListTile(
                  // onTap: () => ,
                  leading: Icon(Icons.add_task),
                  title: Text('add task'),
                ),
                const ListTile(
                  // onTap: () => ,
                  leading: Icon(Icons.task_alt),
                  title: Text('Tasks Page'),
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
