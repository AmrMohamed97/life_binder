import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/edit_note/data/model/notes_model.dart';
 import 'package:note_app/core/widgets/note_view.dart';
import 'package:note_app/features/personal_page/presentation/manager/delete_list_item_cubit/delete_list_item_cubit.dart';
import 'package:note_app/features/personal_page/presentation/manager/delete_list_item_cubit/delete_list_item_state.dart';
 import 'package:note_app/features/personal_page/presentation/pages/widgets/list_item_card_body.dart';
//amr mohamed
class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.notes});
  final NotesModel notes;
  @override
  Widget build(BuildContext context) {
     return BlocProvider(
      create: (context) => DeleteListItemCubit(),
      child: BlocConsumer<DeleteListItemCubit, DeleteListItemStates>(
        listener: (context, state) {
          if (state is DeleteItemErrorState) {
            AwesomeDialog(
              context: context,
              title: 'error',
              body: Text(state.error.code.toString()),
            );
          }
        },
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

