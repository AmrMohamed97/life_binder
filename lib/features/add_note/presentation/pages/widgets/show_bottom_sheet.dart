import 'package:flutter/material.dart';
import 'package:note_app/core/utiles/functions/functions.dart';
import 'package:note_app/core/utiles/responsive/size_config.dart';

class ShowBottomSheet extends StatelessWidget {
  const ShowBottomSheet({super.key,required this.cubit});
  final dynamic cubit;
  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig=SizeConfig(context);
    return Container(
          height: sizeConfig.height200+sizeConfig.height50,
          padding: EdgeInsets.all(sizeConfig.defaultSize*2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Please Choose Image',
                style: TextStyle(
                  fontSize: sizeConfig.defaultSize*3,
                  fontWeight: FontWeight.w700,
                ),
              ),
              InkWell(
                onTap: ()async{
                  await cubit.getImageFromGallery(context);
                },
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: sizeConfig.defaultSize*2,horizontal: sizeConfig.defaultSize*3),
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
                  await cubit.picImageByCamera(context);
                },
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: sizeConfig.defaultSize*2,horizontal: sizeConfig.defaultSize*3),
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
          ),
        );


  }
}
