import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/widgets/custom_text_field.dart';
import 'package:note_app/features/search/manager/search_cubit.dart';
import 'package:note_app/features/search/view/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: CustomTextField(
            controller: BlocProvider.of<SearchCubit>(context).searchController,
            textInputType: TextInputType.text,
            maxLines: 1,
            prefixIcon: const Icon(Icons.search),
            onChanged: (value){
              BlocProvider.of<SearchCubit>(context).assignControllerValue(value);
              BlocProvider.of<SearchCubit>(context).searchData(searchItem: value);
            },
          ),
          ),
        body: const SearchViewBody(),
      ),
    );
  }
}
