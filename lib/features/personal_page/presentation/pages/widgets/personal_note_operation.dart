import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/utiles/functions/custom_show_modal_popup.dart';
import 'package:note_app/features/edit_note/data/model/notes_model.dart';
import 'package:note_app/features/edit_note/presentation/pages/edit_note.dart';
import 'package:note_app/features/personal_page/presentation/manager/note_operation_cubit/note_operation_cubit.dart';

class PersosnalNoteOperation extends StatelessWidget {
  const PersosnalNoteOperation({
    super.key,
    required this.notes,
  });

  final NotesModel notes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              showBackDialog(
                  message: 'Are you sure you want to edit this note?',
                  title: 'Edit Note',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditNotes(noteModel: notes),
                      ),
                    );
                  },
                  context: context);
            },
            child: const Row(
              children: [
                Icon(Icons.edit),
                SizedBox(
                  width: 5,
                ),
                Text('Edit')
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showBackDialog(
                  message: 'Are you sure you want to delete this note?',
                  title: 'Delete Note',
                  onPressed: () async {
                    await BlocProvider.of<NoteOperationCubit>(context)
                        .deleteListItem(
                            id: notes.id, imageName: notes.imageName);
                  },
                  context: context);
            },
            child: const Row(
              children: [
                Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('Delete'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
