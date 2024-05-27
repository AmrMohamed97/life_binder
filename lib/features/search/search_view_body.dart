 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/widgets/no_data_widget.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_cubit/personal_page_cubit.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/list_item.dart';
 import 'package:note_app/features/search/manager/search_cubit.dart';
import 'package:note_app/features/search/manager/search_state.dart';

class SearchViewBody extends StatelessWidget {
   const  SearchViewBody( {required this.state,super.key});
   final SearchStates state;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SearchCubit>(context);
    var personalCubit = BlocProvider.of<PersonalPageCubit>(context);
    return cubit.searchController.text.isEmpty
        ? ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ListItem(notes: personalCubit.notes[index]);
            },
            itemCount: personalCubit.notes.length,
          )
        : state is SearchLoadingState
            ? const Center(child: CircularProgressIndicator())
            : state is SearchSuccessWithoutDataState
                ? const NoDataWidget()
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListItem(notes: cubit.searchNote[index]);
                    },
                    itemCount: cubit.searchNote.length,
                  );
  }
}
