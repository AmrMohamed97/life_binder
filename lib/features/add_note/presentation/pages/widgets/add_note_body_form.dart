import 'package:flutter/material.dart';
import 'package:note_app/features/add_note/presentation/manager/add_note_cubit.dart';
import 'package:note_app/features/add_note/presentation/pages/widgets/add_note_button.dart';
import 'package:note_app/features/add_note/presentation/pages/widgets/add_note_fields.dart';
import 'package:note_app/features/add_note/presentation/pages/widgets/click_to_add_to_exist_picture.dart';
import 'package:note_app/features/add_note/presentation/pages/widgets/click_to_add_to_null_picture.dart';

class AddNoteBodyForm extends StatefulWidget {
  const AddNoteBodyForm({
    super.key,
    required this.titleController,
    required this.cubit,
    required this.noteController,
  });
  final TextEditingController titleController;
  final AddNoteCubit cubit;
  final TextEditingController noteController;

  @override
  State<AddNoteBodyForm> createState() => _AddNoteBodyFormState();
}

class _AddNoteBodyFormState extends State<AddNoteBodyForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 14,
          end: 14,
          top: 14,
          bottom: 14,
        ),
        child: Column(
          children: [
            AddNoteFields(widget: widget),
            if (widget.cubit.file == null)
              ClickToAddNullPicture(widget: widget),
            if (widget.cubit.file != null)
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'Click to change picture',
                      style: TextStyle(
                        color: Color(0xff696969),
                      ),
                    ),
                    ClickToAddToExistPicture(widget: widget),
                  ],
                ),
              ),
            AddNoteButton(formKey: formKey, widget: widget),
          ],
        ),
      ),
    );
  }
}
