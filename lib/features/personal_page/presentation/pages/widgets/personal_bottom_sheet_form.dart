 import 'package:flutter/material.dart';
 import 'package:note_app/core/utiles/responsive/size_config.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/get_gallery_image.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/pic_image.dart';

class PersonalBottomSheetForm extends StatelessWidget {
  const PersonalBottomSheetForm({
    super.key,
    required this.sizeConfig,
    required this.cubit,
    required this.folder,
  });

  final SizeConfig sizeConfig;
  final dynamic cubit;
  final String folder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Please Choose Image',
          style: TextStyle(
            fontSize: sizeConfig.defaultSize * 3,
            fontWeight: FontWeight.w700,
          ),
        ),
        GetGalleryImage(cubit: cubit, folder: folder, sizeConfig: sizeConfig),
        PicImage(cubit: cubit, folder: folder, sizeConfig: sizeConfig),
      ],
    );
  }
}


