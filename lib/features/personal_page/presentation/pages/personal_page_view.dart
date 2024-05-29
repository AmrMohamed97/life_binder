import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/routes/pages_keys.dart';
import 'package:note_app/core/utiles/functions/sign_out.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_state.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/custom_personal_app_bar.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_page_body.dart';

class PersonalPageView extends StatefulWidget {
  const PersonalPageView({super.key});

  @override
  State<PersonalPageView> createState() => _PersonalPageViewState();
}

class _PersonalPageViewState extends State<PersonalPageView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonInfoCubit()
        ..getPersonalImage()
        ..getUserName(),
      child: BlocBuilder<PersonInfoCubit, PersonInfoState>(
          builder: (context, state) {
        var cubit = BlocProvider.of<PersonInfoCubit>(context);
        return Scaffold(
          key: scaffoldKey,
          drawer: CustomDrawer(cubit: cubit),
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.blue,
            onPressed: () {
              Navigator.pushNamed(context, PagesKeys.addNotes);
            },
            child: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              CustomPersonalAppBar(cubit: cubit,scaffoldKey: scaffoldKey,),
              const PersonalPageBody(),
            ],
          ),
        );
      }),
    );
  }
}

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
