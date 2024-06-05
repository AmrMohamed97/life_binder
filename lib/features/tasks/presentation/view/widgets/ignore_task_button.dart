import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
 
class IgnoreTaskButton extends StatelessWidget {
  const IgnoreTaskButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ZoomDrawer.of(context)!.toggle();
      },
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_back_ios_sharp,
            color: AppColors.red,
            size: 20,
          ),
          Text(
            'Close',
            style: TextStyle(
              fontSize: 16,
              // fontWeight: ,
              color: AppColors.red,
            ),
          ),
        ],
      ),
    );
  }
}
