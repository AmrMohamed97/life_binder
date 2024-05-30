import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_change_image_cubit/personal_page_change_image_cubit.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/change_image_icon.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/delete_image_icon.dart';

class CustomChangeImageAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomChangeImageAppBar({
    super.key,
     required this.personalImage,
    required this.folder,
    required this.cubit,
  });

   final String personalImage;
  final String folder;
  final PersonalPageChangeImageCubit cubit;

  @override
  Widget build(BuildContext context) {
    return AppBar(
     backgroundColor: Colors.transparent,
     elevation: 0,
     leading: IconButton(
         onPressed: () {
           Navigator.pop(context);
         },
         icon: const Icon(Icons.arrow_back,
             color: AppColors.gray,
             size:  35),
             ),
     actions: [
       if (personalImage.isNotEmpty)
         DeleteImageIcon(folder: folder),
       ChangeImageIcon( cubit: cubit, folder: folder),
     ],
                  );
  }
  
  @override
   Size get preferredSize =>const  Size.fromHeight(56);
}