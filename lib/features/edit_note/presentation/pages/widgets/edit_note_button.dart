import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/widgets/custom_general_button.dart';
import 'package:note_app/features/edit_note/presentation/manager/edit_note_cubit.dart';
import 'package:note_app/features/edit_note/presentation/pages/widgets/edit_note_body.dart';

class EditNoteButton extends StatelessWidget {
  const EditNoteButton({
    super.key,
    required this.formKey,
    required this.cubit,
    required this.widget,
  });

  final GlobalKey<FormState> formKey;
  final EditNoteCubit cubit;
  final EditNotesBody widget;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: [
          const Expanded(child: SizedBox()),
          CustomGeneralButton(
            // verticalPadding: 10,
            horizontalPadding: 1,
            height: 50 * 1.13,
            label: 'Edit Note',
            color: AppColors.blue,
            onTap: () async {
              // FocusScope.of(context).requestFocus(FocusNode());
              // if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                if (cubit.file ==null && cubit.title!.isEmpty && cubit.note!.isEmpty) {
                  AwesomeDialog(
                          context: context,
                          title: 'error',
                          body: const Text('must add Note or Image'),
                        ).show();
          
                  }else{
                  await cubit.updateData(
                      id: widget.noteModel.id, imageName: widget.noteModel.imageName);
                }
              // }
            },
          ),
        const Flexible(child: SizedBox(height: 10,)),
        ],
      ),
    );
  }
}
