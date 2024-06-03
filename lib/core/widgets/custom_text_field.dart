
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/utiles/responsive/size_config.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.hintText,required this.textInputType, this.controller, this.onFieldSubmitted, required this.maxLines, this.focusNode, this.obscureText, this.onSaved, this.validator, this.inputDecoration, this.prefixIcon, this.maxLength, this.maxLengthEnforcement, this.onChanged, this.textStyle, this.counter, this.hintStyle});
  final String? hintText;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final ValueSetter? onFieldSubmitted,onSaved,onChanged;
  final String? Function(String?)? validator;
   final int maxLines;
   final int?  maxLength;
   final MaxLengthEnforcement? maxLengthEnforcement;
  final FocusNode? focusNode;
  final bool? obscureText;
  final InputDecoration? inputDecoration;
  final Widget? prefixIcon,counter;
  final TextStyle? textStyle,hintStyle;
   @override
  Widget build(BuildContext context) {
     SizeConfig sizeConfig=SizeConfig(context);
    return TextFormField(
      validator: validator,
      decoration: inputDecoration??InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(sizeConfig.defaultSize*.8),
          borderSide:const  BorderSide(
            color: AppColors.gray,
          ),
        ),
        filled: true,
        fillColor: Colors.transparent,
        isDense:true ,
        // contentPadding: EdgeInsets.zero,
        prefixIcon: prefixIcon,
        counter: counter,
      ),
      keyboardType: textInputType ,
      controller: controller,
      onFieldSubmitted:onFieldSubmitted ,
      onSaved: onSaved,
      maxLines:maxLines ,
      // minLines: minLine??1,
      focusNode:focusNode ,
      obscureText: obscureText?? false,
      maxLengthEnforcement: maxLengthEnforcement,
      maxLength: maxLength,
      onChanged: onChanged,
      style: textStyle,
    );
  }
}
