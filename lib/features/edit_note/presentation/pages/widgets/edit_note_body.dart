import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/features/edit_note/data/model/notes_model.dart';
import 'package:note_app/features/edit_note/presentation/manager/edit_note_cubit.dart';
import 'package:note_app/features/edit_note/presentation/manager/edit_note_state.dart';
import 'package:note_app/core/routes/pages_keys.dart';
import 'package:note_app/features/edit_note/presentation/pages/widgets/edit_note_form.dart';

class EditNotesBody extends StatefulWidget {
  const EditNotesBody({super.key, required this.noteModel});
  final NotesModel noteModel;

  @override
  State<EditNotesBody> createState() => _EditNotesBodyState();
}

class _EditNotesBodyState extends State<EditNotesBody> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final noteController = TextEditingController();
  @override
  void initState() {
    titleController.text = widget.noteModel.title;
    noteController.text = widget.noteModel.notes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditNoteCubit, EditNoteState>(
      listener: (context, state) {
        var cubit = BlocProvider.of<EditNoteCubit>(context);
        if (state is EditDataLoadingState) {
          cubit.isLoading = true;
        } else if (state is EditDataSuccessState) {
          cubit.file = null;
          titleController.clear();
          noteController.clear();
          cubit.isLoading = false;
          Navigator.pushReplacementNamed(context, PagesKeys.personalPageView);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'your note updated success',
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
            duration: Duration(
              seconds: 3,
            ),
            backgroundColor: AppColors.lightGreen,
          ));
        } else if (state is EditDataErrorState) {
          cubit.isLoading = false;
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<EditNoteCubit>(context);
        return ModalProgressHUD(
          inAsyncCall: cubit.isLoading,
          child: EditNoteForm(
            formKey: formKey,
            titleController: titleController,
            cubit: cubit,
            noteController: noteController,
            widget: widget,
            noteModel: widget.noteModel,
          ),
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
