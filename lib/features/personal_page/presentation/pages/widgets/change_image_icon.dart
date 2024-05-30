import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_change_image_cubit/personal_page_change_image_cubit.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_bottom_sheet.dart';

class ChangeImageIcon extends StatelessWidget {
  const ChangeImageIcon({
    super.key,
     required this.cubit,
    required this.folder,
  });

   final PersonalPageChangeImageCubit cubit;
  final String folder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          end: 15,
          top: 10),
      child: IconButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return PersonalBottomSheet(
                    cubit: cubit,
                    folder: folder,
                  );
                });
          },
          icon: const Icon(
            Icons.camera_alt,
            size: 40,
            color: AppColors.gray,
          )),
    );
  }
}