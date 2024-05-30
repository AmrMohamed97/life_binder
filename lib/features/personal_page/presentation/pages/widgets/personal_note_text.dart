import 'package:flutter/material.dart';
import 'package:note_app/features/edit_note/data/model/notes_model.dart';

class PersonalNoteText extends StatelessWidget {
  const PersonalNoteText({
    super.key,
    required this.notes,
  });

  final NotesModel notes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          notes.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          notes.notes,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
