import 'package:flutter/material.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_cubit/personal_page_cubit.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/change_image_page.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_image.dart';

class CustomAppBarFlexableSpaceDetail extends StatelessWidget {
  const CustomAppBarFlexableSpaceDetail({super.key, required this.cubit,});

  final PersonalPageCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeImagePage(
                  personalImage: cubit.personalImage,
                  image: cubit.personalImage.isEmpty
                      ? 'assets/images/3.png'
                      : cubit.personalImage,
                  folder: 'personal',
                ),
              ),
            );
          },
          child: PersonalImage(cubit: cubit),
        ),
        cubit.userName == null ? const Text(' ') : userName(cubit),
      ],
    );
  }
}

Text userName(cubit) {
  return Text(
    '${cubit.userName}',
    style: const TextStyle(color: Colors.black, fontSize: 18),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}
