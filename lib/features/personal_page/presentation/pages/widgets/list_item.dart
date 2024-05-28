import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/edit_note/data/model/notes_model.dart';
 import 'package:note_app/core/widgets/note_view.dart';
 import 'package:note_app/features/personal_page/presentation/manager/note_operation_cubit/note_operation_cubit.dart';
  import 'package:note_app/features/personal_page/presentation/pages/widgets/list_item_card_body.dart';
//amr mohamed
class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.notes});
  final NotesModel notes;
  @override
  Widget build(BuildContext context) {
     return   Dismissible(
           key: UniqueKey(),
           onDismissed: (direction) async {
             await BlocProvider.of<NoteOperationCubit>(context)
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
  }
}

