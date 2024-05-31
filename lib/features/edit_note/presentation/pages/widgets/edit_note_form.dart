import 'package:flutter/material.dart';
import 'package:note_app/features/edit_note/presentation/manager/edit_note_cubit.dart';
import 'package:note_app/features/edit_note/presentation/pages/widgets/edit_note_body.dart';
import 'package:note_app/features/edit_note/presentation/pages/widgets/edit_note_button.dart';
import 'package:note_app/features/edit_note/presentation/pages/widgets/edit_note_default_image.dart';
import 'package:note_app/features/edit_note/presentation/pages/widgets/edit_note_form_fields.dart';
import 'package:note_app/features/edit_note/presentation/pages/widgets/edit_note_image.dart';

class EditNoteForm extends StatelessWidget {
  const EditNoteForm({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.cubit,
    required this.noteController,
    required this.widget,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final EditNoteCubit cubit;
  final TextEditingController noteController;
  final EditNotesBody widget;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding:const  EdgeInsetsDirectional.only(
          start: 10 * 1.5,
          end: 10 * 1.5,
          top: 10 * 1.5,
          bottom: 10 * .5,
        ),
        child: CustomScrollView(
          slivers: [
            EditNoteFormFields(titleController: titleController, cubit: cubit,noteController: noteController),
            if (cubit.file != null)
              EditNoteImage(cubit: cubit),
            if (cubit.file == null)
              EditNoteDefaultImage(cubit: cubit),
            EditNoteButton(formKey: formKey, cubit: cubit, widget: widget),
          ],
        ),
      ),
    );
  }
}




