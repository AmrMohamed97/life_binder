import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_page_loading.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_state.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/custom_drawer.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/custom_personal_app_bar.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_page_body.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_page_operation_button.dart';

class PersonalPageView extends StatefulWidget {
  const PersonalPageView({super.key});

  @override
  State<PersonalPageView> createState() => _PersonalPageViewState();
}

class _PersonalPageViewState extends State<PersonalPageView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonInfoCubit()
        ..getPersonalImage()
        ..getUserName(),
      child: BlocBuilder<PersonInfoCubit, PersonInfoState>(
          builder: (context, state) {
        var cubit = BlocProvider.of<PersonInfoCubit>(context);
        return Scaffold(
           key: scaffoldKey,
          drawer: CustomDrawer(cubit: cubit),
          resizeToAvoidBottomInset: false,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              if (state is GetPersonalImageLoadingState)
                const SliverFillRemaining(
                  child: PersonalPageLoading(),
                ),
              if (state is! GetPersonalImageLoadingState)
                CustomPersonalAppBar(
                  cubit: cubit,
                  scaffoldKey: scaffoldKey,
                ),
              if (state is! GetPersonalImageLoadingState)
                PersonalPageOperationButton(cubit: cubit,),
              if (state is! GetPersonalImageLoadingState)
                PersonalPageBody(
                  personCubit: cubit,
                ),
            ],
          ),
        );
      }),
    );
  }
}
