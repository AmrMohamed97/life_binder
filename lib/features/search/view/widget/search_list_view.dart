import 'package:flutter/material.dart';
 import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/list_item.dart';
import 'package:note_app/features/search/manager/search_cubit.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
    required this.cubit, required this.personCubit,
  });

  final SearchCubit cubit;
  final PersonInfoCubit personCubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ListItem(notes: cubit.searchNote[index],cubit: personCubit,);
      },
      itemCount: cubit.searchNote.length,
    );
  }
}