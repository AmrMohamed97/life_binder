import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/features/add_note/presentation/manager/add_note_cubit.dart';
import 'package:note_app/features/add_note/presentation/pages/widgets/add_notes_body.dart';

class AddNotes extends StatelessWidget {
  const AddNotes({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=> AddNoteCubit(),
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: AppColors.blue,
            title: const Text(
              'Add Notes',
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: AppColors.white,
              ),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ),
          body: AddNotesBody(),
        ),
      ),
    );
  }
}
