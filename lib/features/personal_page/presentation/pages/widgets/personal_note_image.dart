import 'package:flutter/material.dart';
import 'package:note_app/core/widgets/note_view.dart';
import 'package:note_app/features/edit_note/data/model/notes_model.dart';

class PersonalNoteImage extends StatelessWidget {
  const PersonalNoteImage({
    super.key,
    required this.notes,
  });

  final NotesModel notes;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return NoteView(
              imageUrl: notes.imageUrl,
            );
          }),
        );
      },
      child: AspectRatio(
        aspectRatio: 2 / 1.15,
        child: Image.network(
          notes.imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}