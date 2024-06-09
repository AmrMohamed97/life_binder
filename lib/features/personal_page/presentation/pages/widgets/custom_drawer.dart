 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:note_app/features/auth/presentation/manager/app_theme_cubit/app_theme_cubit.dart';
import 'package:note_app/features/auth/presentation/manager/app_theme_cubit/app_theme_state.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/drawer_body.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/drawer_header.dart';
 
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.cubit,
  });

  final PersonInfoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CustomDrawerHeader(cubit: cubit,),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: DrawerBody(cubit: cubit),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



