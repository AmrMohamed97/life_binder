 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/personal_page/presentation/manager/note_operation_cubit/note_operation_cubit.dart';
import 'package:note_app/features/personal_page/presentation/manager/note_operation_cubit/note_operation_state.dart';
  import 'package:note_app/features/personal_page/presentation/pages/widgets/list_item.dart';
import 'package:note_app/core/widgets/no_data_widget.dart';
  
class PersonalPageBody extends StatelessWidget {
  const PersonalPageBody({
    super.key,});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>NoteOperationCubit()..getUserNotes(),
    child: BlocBuilder<NoteOperationCubit ,  NoteOperationState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<NoteOperationCubit>(context);
        return cubit.notes.isEmpty
            ? State is GetUserNotesLoadingState
                    ?const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()))
                    :const SliverFillRemaining(child: NoDataWidget())
            :SliverList.builder(
          itemBuilder: (context,index){
            return ListItem(notes: cubit.notes[index]);
          },
          itemCount: cubit.notes.length,
        );
      }
    ),
    );
    
  }
}

