import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/utiles/functions/custom_show_modal_popup.dart';
import 'package:note_app/features/edit_note/data/model/notes_model.dart';
import 'package:note_app/core/widgets/note_view.dart';
import 'package:note_app/features/edit_note/presentation/pages/edit_note.dart';
import 'package:note_app/features/personal_page/presentation/manager/note_operation_cubit/note_operation_cubit.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';

//amr mohamed
class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.notes, required this.cubit});
  final NotesModel notes;
  final PersonInfoCubit cubit;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return NoteView(
              title: notes.title,
              imageUrl: notes.imageUrl,
              note: notes.notes,
            );
          }),
        );
      },
      child: SizedBox(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(cubit.personalImage),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${cubit.userName}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const Text(
                            'since 8 day',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
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
              ),
            ),
            AspectRatio(
              aspectRatio: 2 / 1.15,
              child: Image.network(
                notes.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            Divider(
              height: 3,
              color: Colors.grey[350],
              thickness: 1.5,
              indent: 12,
              endIndent: 14,
            ),
            Padding(
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
                                builder: (context) =>
                                    EditNotes(noteModel: notes),
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
                          message:
                              'Are you sure you want to delete this note?',
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
            ),
          ],
        ),
      ),
    );
  }
}
