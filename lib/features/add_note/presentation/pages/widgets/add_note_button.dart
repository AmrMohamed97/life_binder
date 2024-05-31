import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/widgets/custom_general_button.dart';
import 'package:note_app/features/add_note/presentation/pages/widgets/add_note_body_form.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({
    super.key,
    required this.formKey,
    required this.widget,
  });

  final GlobalKey<FormState> formKey;
  final AddNoteBodyForm widget;

  @override
  Widget build(BuildContext context) {
    return CustomGeneralButton(
      verticalPadding:10,
      horizontalPadding: 1,
      height: 50*1.13,
      label:'Add Note',
      color: AppColors.blue,
      onTap: ()async{
        FocusScope.of(context).requestFocus(FocusNode());
        // if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          // if (widget.cubit.file != null) {
        if(widget.cubit.file == null && widget.cubit.title!.isEmpty && widget.cubit.note!.isEmpty){
          AwesomeDialog(
                  context: context,
                  title: 'error',
                  body: const Text('must add note or image'),
                ).show();
        }else{
          widget.cubit.uploadNote(context);
        }

          // }
          // else{
          //   AwesomeDialog(
          //     context: context,
          //     title: 'error',
          //     body: const Text('must add Image'),
          //   ).show();
          // }
        // }
      },
    );
  }
}
