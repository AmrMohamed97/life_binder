import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/utiles/responsive/size_config.dart';
import 'package:note_app/core/widgets/no_data_widget.dart';
import 'package:note_app/core/widgets/list_item.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_cubit.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_state.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/change_image_page.dart';
import 'package:note_app/features/routes/pages_keys.dart';

class PersonalPageView extends StatelessWidget {
  const PersonalPageView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);
    return BlocProvider(
      create: (context) => PersonalPageCubit()
        ..getUserNotes()
        ..getUserName()
        ..getPersonalImage()
        ..getBackgroundImage(),
      child: BlocConsumer<PersonalPageCubit, PersonalPageState>(
        listener: (context, state) {
          if(state is DeleteItemErrorState){
            AwesomeDialog(
              context: context,
              title: 'error',
              body: Text(state.error.code.toString()),
            );
          }
        },
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
                  body: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverAppBar(

                        automaticallyImplyLeading: false,
                        actions: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, PagesKeys.searchView);
                            },
                            icon: const Icon(
                              Icons.search,
                              color: AppColors.black,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                                end: sizeConfig.defaultSize),
                            child: IconButton(
                              onPressed: () async {
                                await FirebaseAuth.instance
                                    .signOut()
                                    .then((value) {
                                  Navigator.pushReplacementNamed(
                                      context, PagesKeys.loginView);
                                });
                              },
                              icon: const Icon(
                                Icons.exit_to_app,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                        floating: true,
                        pinned: true,
                        primary: true,
                        snap: false,
                        stretch: true,
                        stretchTriggerOffset: 100,
                        expandedHeight: sizeConfig.height10 * 25,
                        flexibleSpace: FlexibleSpaceBar(
                          title: SafeArea(
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ChangeImagePage(
                                            personalImage: cubit.personalImage,
                                            image: cubit.personalImage.isEmpty
                                                ? 'assets/images/3.png'
                                                : cubit.personalImage,
                                            folder: 'personal',
                                          ),
                                        ),
                                      );
                                    },
                                    child: cubit.personalImage.isEmpty
                                        ? CircleAvatar(
                                            radius:
                                                sizeConfig.defaultSize * 3.5,
                                            backgroundImage: const AssetImage('assets/images/3.png'),)
                                        : CircleAvatar(
                                            radius:
                                                sizeConfig.defaultSize * 3.5,
                                            backgroundImage: NetworkImage(
                                                cubit.personalImage),
                                          ),
                                  ),
                                   Text(
                                    '${cubit.userName}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 18),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          centerTitle: false,
                          stretchModes:const  [StretchMode.fadeTitle,StretchMode.blurBackground,StretchMode.zoomBackground],
                          background: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChangeImagePage(
                                          personalImage: cubit.backgroundImage,
                                          image: 'assets/images/4.png',
                                          folder: 'background')));
                            },
                            child: cubit.backgroundImage.isEmpty
                                ? Image.asset(
                                    'assets/images/4.png',
                                  )
                                : Image.network(
                                    cubit.backgroundImage,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                          ),
                        ),
                      ),
                      cubit.notes.isEmpty
                          ? state is GetUserNotesLoadingState
                                  ?const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()))
                                  :const SliverFillRemaining(child: NoDataWidget())
                          :SliverList.builder(
                        itemBuilder: (context,index){
                          return ListItem(notes: cubit.notes[index]);
                        },
                        itemCount: cubit.notes.length,
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
