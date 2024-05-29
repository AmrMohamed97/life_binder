import 'package:flutter/material.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/change_image_page.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_image.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/user_name_widget.dart';

class CustomAppBarFlexableSpaceDetail extends StatelessWidget {
  const CustomAppBarFlexableSpaceDetail({
    super.key,
    required this.cubit,
  });
  final PersonInfoCubit cubit;
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
        UserNameWidget(
          cubit: cubit,
        ),
      ],
    );
  }
}
