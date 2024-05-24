import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/widgets/no_data_widget.dart';
  import 'package:note_app/core/widgets/list_item.dart';
  import 'package:note_app/features/personal_page/presentation/manager/personal_page_state.dart';
import 'package:note_app/features/search/manager/search_cubit.dart';
import 'package:note_app/features/search/manager/search_states.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SearchCubit>(context);
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {
        if(state is DeleteItemErrorState){
          AwesomeDialog(
            context: context,
            title: 'error',
            body: Text(state.error.code.toString()),
          );
        }
      },
      builder: (context, state) {
        return  cubit.searchController.text.isEmpty
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListItem(notes: cubit.notes[index]);
                        },
                        itemCount: cubit.notes.length,
                      )
                    : state is SearchLoadingState
            ? const Center(child: CircularProgressIndicator())
            : state is SearchSuccessWithoutDataState
            ? const NoDataWidget()
            :ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListItem(notes: cubit.searchNote[index]);
                        },
                        itemCount: cubit.searchNote.length,
                      );
      },
    );
  }
}
