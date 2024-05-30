import 'package:flutter/material.dart';
 import 'package:note_app/features/edit_note/data/model/notes_model.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_note_header.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_note_image.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_note_operation.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_note_text.dart';

//amr mohamed
class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.notes, required this.cubit});
  final NotesModel notes;
  final PersonInfoCubit cubit;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: Colors.grey[350],
            thickness: 5,
            height: 6,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PersonalNoteHeader(cubit: cubit),
                const SizedBox(
                  height: 15,
                ),
                PersonalNoteText(notes: notes),
              ],
            ),
          ),
          PersonalNoteImage(notes: notes),
          Divider(
            height: 3,
            color: Colors.grey[350],
            thickness: 1.5,
            indent: 12,
            endIndent: 14,
          ),
          PersosnalNoteOperation(notes: notes),
        ],
      ),
    );
  }
}






