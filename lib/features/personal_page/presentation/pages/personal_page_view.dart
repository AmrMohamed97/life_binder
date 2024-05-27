import 'package:flutter/material.dart';
 import 'package:note_app/core/constants/colors/app_colors.dart';
  import 'package:note_app/core/routes/pages_keys.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/custom_personal_app_bar.dart';
 import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_page_body.dart';

class PersonalPageView extends StatelessWidget {
  const PersonalPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return 
    // BlocProvider(
    //   create: (context) => PersonalPageCubit()
    //     ..getUserName()
    //     ..getPersonalImage()
    //     ..getBackgroundImage(),
    //   child: BlocBuilder<PersonalPageCubit, PersonalPageState>( 
    //     builder: (context, state) {
    //       return  State is GetPersonalImageLoadingState
          //     ? const Center(child: CircularProgressIndicator())
          //     : 
              Scaffold(
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
                  body: const CustomScrollView(
      physics:   BouncingScrollPhysics(),
      slivers: [
        CustomPersonalAppBar(),
          PersonalPageBody(),
      ],
    ),
                );
        }
     
  }

