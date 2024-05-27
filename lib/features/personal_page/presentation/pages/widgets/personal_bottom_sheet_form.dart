import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/utiles/functions/functions.dart';
import 'package:note_app/core/utiles/responsive/size_config.dart';

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
        InkWell(
          onTap: () async {
            await cubit.getPersonalOrBackgroundImage(context,
                folder: folder);
          },
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: sizeConfig.defaultSize * 2,
                  horizontal: sizeConfig.defaultSize * 3),
              child: Row(
                children: [
                  const Icon(
                    Icons.image,
                    size: 30,
                  ),
                  horizontalHeight(sizeConfig.width20),
                  const Text(
                    'From Gallery',
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            await cubit.picPersonalOrBackgroundImage(
              context,
              folder: folder,
            );
          },
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: sizeConfig.defaultSize * 2,
                  horizontal: sizeConfig.defaultSize * 3),
              child: Row(
                children: [
                  const Icon(
                    Icons.camera,
                    size: 30,
                  ),
                  horizontalHeight(sizeConfig.width20),
                  const Text(
                    'From Camera',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
