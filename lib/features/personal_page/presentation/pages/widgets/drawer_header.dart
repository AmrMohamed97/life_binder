import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/features/auth/presentation/manager/app_theme_cubit/app_theme_cubit.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    super.key,
    required this.cubit,
  });

  final PersonInfoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: BlocProvider.of<AppThemeCubit>(context).isDark
            ? Colors.black
            : AppColors.blue,
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
    );
  }
}
