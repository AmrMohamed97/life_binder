import 'package:flutter/material.dart';
import 'package:note_app/features/edit_note/data/model/notes_model.dart';
import 'package:note_app/features/edit_note/presentation/pages/edit_note.dart';

class ListItemCardBody extends StatelessWidget {
  const ListItemCardBody({
    super.key,
    required this.notes,
   });

  final NotesModel notes;
 
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Image.network(
            notes.imageUrl,
            fit: BoxFit.fill,
            height:  90,
            width:  100,
          ),
        ),
        Flexible(
          flex: 3,
          child: ListTile(
            title: Text(
              notes.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              notes.notes,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EditNotes(noteModel: notes),
                  ),
                );
              },
              icon: const Icon(Icons.edit),
            ),
          ),
        ),
      ],
    );
  }
}
