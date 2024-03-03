
import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/utiles/responsive/size_config.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({super.key, this.height, this.width,required this.label, this.radius, this.onTap, this.horizontalPadding, this.verticalPadding, this.color});
  final String label;
  final double? width,height,radius,horizontalPadding,verticalPadding;
  final VoidCallback? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: verticalPadding?? 0,horizontal: horizontalPadding?? 0),
        height: height?? sizeConfig.height60,
        width: width?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius?? sizeConfig.defaultSize),
          color: color?? AppColors.lightGreen,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize:sizeConfig.defaultSize*1.4,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
