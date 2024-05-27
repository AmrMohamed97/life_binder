import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/widgets/custom_text_field.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_cubit/get_user_name_state.dart';
import 'package:note_app/features/search/manager/search_cubit.dart';
import 'package:note_app/features/search/manager/search_state.dart';
import 'package:note_app/features/search/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {
          // if (state is DeleteItemErrorState) {
          // AwesomeDialog(
          //   context: context,
          //   title: 'error',
          //   body: Text(state.error.code.toString()),
          // );
        // }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
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
              ),
              body:   SearchViewBody(state: state),
            ),
          );
        },
      ),
    );
  }
}
