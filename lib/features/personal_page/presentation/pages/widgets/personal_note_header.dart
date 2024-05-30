import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:note_app/features/edit_note/data/model/notes_model.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';

class PersonalNoteHeader extends StatelessWidget {
  const PersonalNoteHeader({
    super.key,
    required this.cubit,
    required this.note,
  });

  final PersonInfoCubit cubit;
  final NotesModel note;

  @override
  Widget build(BuildContext context) {
    return Row(
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
            Text(
              //  Jiffy(note.date,'dd-MM-yyyy').fromNow() ,
              Jiffy.parse(note.date).endOf(Unit.month).yMMMMEEEEd,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
