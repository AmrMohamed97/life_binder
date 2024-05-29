import 'package:awesome_dialog/awesome_dialog.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/personal_page/presentation/manager/note_operation_cubit/note_operation_cubit.dart';
import 'package:note_app/features/personal_page/presentation/manager/note_operation_cubit/note_operation_state.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/list_item.dart';
import 'package:note_app/core/widgets/no_data_widget.dart';

class PersonalPageBody extends StatelessWidget {
  const PersonalPageBody({
    super.key, required this.personCubit,
  });
  final PersonInfoCubit personCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteOperationCubit()..getUserNotes(),
      child: BlocConsumer<NoteOperationCubit, NoteOperationState>(
          listener: (context, state) {
        if (state is DeleteItemErrorState) {
          AwesomeDialog(
            context: context,
            title: 'error',
            body: Text(state.error.code.toString()),
          );
        }
      }, builder: (context, state) {
        var cubit = BlocProvider.of<NoteOperationCubit>(context);
        return cubit.notes.isEmpty
            ? State is GetUserNotesLoadingState
                ? const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()))
                : const SliverFillRemaining(child: NoDataWidget())
            : SliverList.builder(
                itemBuilder: (context, index) {
                  return ListItem(
                      notes: cubit.notes[index], cubit: personCubit);
                },
                itemCount: cubit.notes.length,
              );
      }),
    );
  }
}
