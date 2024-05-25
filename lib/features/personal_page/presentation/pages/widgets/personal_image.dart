import 'package:flutter/material.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_cubit.dart';

class PersonalImage extends StatelessWidget {
  const PersonalImage({super.key, required this.cubit});

  final PersonalPageCubit cubit;

  @override
  Widget build(BuildContext context) {
    return cubit.personalImage.isEmpty
        ? const CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/images/3.png'),
          )
        : CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(cubit.personalImage),
          );
  }
}
