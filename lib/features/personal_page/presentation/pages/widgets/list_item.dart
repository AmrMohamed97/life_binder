import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/edit_note/data/model/notes_model.dart';
 import 'package:note_app/core/widgets/note_view.dart';
import 'package:note_app/features/personal_page/presentation/manager/delete_list_item_cubit.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_state.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/list_item_card_body.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.notes});
  final NotesModel notes;
  @override
  Widget build(BuildContext context) {
     return BlocProvider(
      create: (context) => DeleteListItemCubit(),
      child: BlocBuilder<DeleteListItemCubit, PersonalPageState>(
        builder: (context, state) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) async {
              await BlocProvider.of<DeleteListItemCubit>(context)
                  .deleteListItem(id: notes.id, imageName: notes.imageName);
            },
            child: InkWell(
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
              child: Card(
                child: ListItemCardBody(notes: notes,),
              ),
            ),
          );
        },
      ),
    );
  }
}

