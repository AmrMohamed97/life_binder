import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/widgets/custom_text_field.dart';
import 'package:note_app/features/edit_note/presentation/manager/edit_note_cubit.dart';

class EditNoteFormFields extends StatelessWidget {
  const EditNoteFormFields({
    super.key,
    required this.titleController,
    required this.cubit,
     required this.noteController,
  });

  final TextEditingController titleController;
  final EditNoteCubit cubit;
   final TextEditingController noteController;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          CustomTextField(
            controller: titleController,
            onSaved: (val) {
              cubit.title = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'This Field is required';
              }
              return null;
            },
            textInputType: TextInputType.text,
            maxLines: 1,
            prefixIcon: const Icon(Icons.note),
            hintText: 'Title Note',
            maxLength: 30,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
          ),
          const SizedBox(height: 10,),
          CustomTextField(
            controller: noteController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'This Field is required';
              }
              return null;
            },
            onSaved: (val) {
              cubit.note = val;
            },
            textInputType: TextInputType.multiline,
            maxLines: 5,
            prefixIcon: const Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 10 * 1.2,
                  top: 0,
                  end: 0,
                  bottom: 10 * 9),
              child:   FaIcon(FontAwesomeIcons.message),
            ),
            hintText: 'Note',
            maxLength: 200,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}
