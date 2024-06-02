import 'package:flutter/material.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
 import 'package:note_app/features/add_note/presentation/manager/add_note_cubit.dart';
import 'package:note_app/features/add_note/presentation/manager/add_note_state.dart';
import 'package:note_app/features/add_note/presentation/pages/widgets/add_note_body_form.dart';
 import 'package:note_app/core/routes/pages_keys.dart';

class AddNotesBody extends StatefulWidget {
    const AddNotesBody({super.key});

  @override
  State<AddNotesBody> createState() => _AddNotesBodyState();
}

class _AddNotesBodyState extends State<AddNotesBody> {
     final titleController=TextEditingController();

    final noteController=TextEditingController();

 

  @override
  Widget build(BuildContext context) {
     var cubit=BlocProvider.of<AddNoteCubit>(context);
    return BlocConsumer<AddNoteCubit,AddNoteState>(
      listener: (context,state){
        if(state is NoteUploadLoading){
          cubit.isLoading=true;
        }else if(state is NoteUploadedSuccess){
          cubit.file=null;
          titleController.clear();
          noteController.clear();
          cubit.isLoading=false;
          Navigator.pushNamed(context, PagesKeys.personalPageView);
        }else if(state is NoteUploadError){
          cubit.isLoading=false;
        }
      },
      builder: (context,state){
        return ModalProgressHUD(
          inAsyncCall: cubit.isLoading,
          child: AddNoteBodyForm( titleController: titleController, cubit: cubit, noteController: noteController),
        );
      },
    );
  }

   @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }
}

