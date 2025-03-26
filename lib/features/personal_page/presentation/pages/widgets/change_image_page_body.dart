import 'package:flutter/material.dart';

class ChangeImagePageBody extends StatelessWidget {
  const ChangeImagePageBody(
      {super.key,
      required this.image,
      required this.folder,
      required this.personalImage});
  final String image, folder, personalImage;
  @override
  Widget build(BuildContext context) {
    return personalImage.isEmpty 
        ? Center(
            child: InteractiveViewer(
              child: Image.asset(
                image,
              ),
            ),
          )
        : Center(
            child: InteractiveViewer(
              child: Image.network(
                personalImage,
              ),
            ),
          );
  }
}
