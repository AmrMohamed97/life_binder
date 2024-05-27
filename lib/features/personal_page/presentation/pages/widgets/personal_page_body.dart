 import 'package:flutter/material.dart';
  import 'package:note_app/features/personal_page/presentation/pages/widgets/list_item.dart';
import 'package:note_app/core/widgets/no_data_widget.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_cubit/personal_page_cubit.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_state.dart';
 import 'package:note_app/features/personal_page/presentation/pages/widgets/custom_personal_app_bar.dart';
 
class BersonalPageBody extends StatelessWidget {
  const BersonalPageBody({
    super.key,
     
    required this.cubit,
  });

   final PersonalPageCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        CustomPersonalAppBar(cubit: cubit),
        cubit.notes.isEmpty
            ? State is GetUserNotesLoadingState
                    ?const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()))
                    :const SliverFillRemaining(child: NoDataWidget())
            :SliverList.builder(
          itemBuilder: (context,index){
            return ListItem(notes: cubit.notes[index]);
          },
          itemCount: cubit.notes.length,
        )
      ],
    );
  }
}

