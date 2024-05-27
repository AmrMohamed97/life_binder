import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_cubit/personal_page_cubit.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_state.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_page_body.dart';
import 'package:note_app/features/routes/pages_keys.dart';

class PersonalPageView extends StatelessWidget {
  const PersonalPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalPageCubit()
        ..getUserNotes()
        ..getUserName()
        ..getPersonalImage()
        ..getBackgroundImage(),
      child: BlocBuilder<PersonalPageCubit, PersonalPageState>( 
        builder: (context, state) {
          var cubit = BlocProvider.of<PersonalPageCubit>(context);
          return State is GetPersonalImageLoadingState
              ? const Center(child: CircularProgressIndicator())
              : Scaffold(
                  resizeToAvoidBottomInset: false,
                  floatingActionButton: FloatingActionButton(
                    backgroundColor: AppColors.blue,
                    onPressed: () {
                      Navigator.pushNamed(context, PagesKeys.addNotes);
                    },
                    child: const Icon(
                      Icons.add,
                      color: AppColors.white,
                    ),
                  ),
                  body: BersonalPageBody(
                    cubit: cubit,
                  ),
                );
        },
      ),
    );
  }
}
