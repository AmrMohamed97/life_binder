import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/features/edit_note/data/model/notes_model.dart';
import 'package:note_app/features/edit_note/presentation/manager/edit_note_cubit.dart';
import 'package:note_app/features/edit_note/presentation/pages/widgets/edit_note_body.dart';

class EditNotes extends StatelessWidget {
   const EditNotes({super.key,required this.noteModel});
  final NotesModel noteModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=> EditNoteCubit(),
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.blue,
            title: const Text(
              'Edit Note',
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
            centerTitle: true,
          ),
          body: EditNotesBody(noteModel:noteModel),
        ),
      ),
    );
  }
}
