import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/utiles/responsive/size_config.dart';
import 'package:note_app/features/edit_note/data/model/notes_model.dart';
import 'package:note_app/features/edit_note/presentation/pages/edit_note.dart';
import 'package:note_app/core/widgets/note_view.dart';
 import 'package:note_app/features/personal_page/presentation/manager/personal_page_cubit.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.notes });
  final NotesModel notes;
  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig=SizeConfig(context);
    return  Dismissible(
          key:UniqueKey() ,
          onDismissed: (direction)async{
            await BlocProvider.of<PersonalPageCubit>(context).deleteListItem(id: notes.id, imageName: notes.imageName);
          },
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return NoteView(
                      title:notes.title,
                      imageUrl:notes.imageUrl,
                      note:notes.notes,
                    );
                  }
              ),
              );
            },
            child: Card(
              child: cardBody(sizeConfig,context),
            ),
          ),
        );
  }
  Row cardBody(SizeConfig sizeConfig,context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Image.network(
            notes.imageUrl,
            fit: BoxFit.fill,
            height: sizeConfig.height90,
            width: sizeConfig.width100,
          ),
        ),
        Flexible(
          flex: 3,
          child: ListTile(
            title: Text(
              notes.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              notes.notes,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              onPressed: (){
                Navigator.pushReplacement(context , MaterialPageRoute(
                  builder:(context)=>EditNotes(noteModel: notes) ,
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
