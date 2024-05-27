 import 'package:flutter/material.dart';
import 'package:note_app/core/utiles/functions/functions.dart';
import 'package:note_app/core/utiles/responsive/size_config.dart';

class PicImage extends StatelessWidget {
  const PicImage({
    super.key,
    required this.cubit,
    required this.folder,
    required this.sizeConfig,
  });

  final dynamic cubit;
  final String folder;
  final SizeConfig sizeConfig;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    );
  }
}
