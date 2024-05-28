import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/widgets/custom_text_field.dart';
import 'package:note_app/features/search/manager/search_cubit.dart';

class SearchViewAppBar extends StatelessWidget implements PreferredSizeWidget{
  const SearchViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomTextField(
        controller:
            BlocProvider.of<SearchCubit>(context).searchController,
        textInputType: TextInputType.text,
        maxLines: 1,
        prefixIcon: const Icon(Icons.search),
        onChanged: (value) {
          BlocProvider.of<SearchCubit>(context)
              .assignControllerValue(value);
          BlocProvider.of<SearchCubit>(context)
              .searchData(searchItem: value);
        },
      ),
    );
  }
  
  @override
   Size get preferredSize =>const  Size.fromHeight(56);
   
}
