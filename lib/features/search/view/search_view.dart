import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/widgets/no_data_widget.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';
import 'package:note_app/features/search/manager/search_cubit.dart';
import 'package:note_app/features/search/manager/search_state.dart';
import 'package:note_app/features/search/view/widget/search_list_view.dart';
import 'package:note_app/features/search/view/widget/search_view_app_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.personCubit});
  final PersonInfoCubit personCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocBuilder<SearchCubit, SearchStates>(
        builder: (context, state) {
          var cubit = BlocProvider.of<SearchCubit>(context);
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: const SearchViewAppBar(),
              body: state is SearchLoadingState
                  ? const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: LinearProgressIndicator(),
                    )
                  : state is SearchSuccessWithoutDataState
                      ? const NoDataWidget()
                      : SearchListView(cubit: cubit, personCubit: personCubit),
            ),
          );
        },
      ),
    );
  }
}
