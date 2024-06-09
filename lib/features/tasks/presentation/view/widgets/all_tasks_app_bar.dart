import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/features/auth/presentation/manager/app_theme_cubit/app_theme_cubit.dart';

class AllTasksAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AllTasksAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:BlocProvider.of<AppThemeCubit>(context).isDark?null: AppColors.blue,
      leading: IconButton(
        onPressed: () {
          ZoomDrawer.of(context)?.toggle() ;
        },
        icon: const Icon(Icons.menu),
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          // fontSize: ,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
