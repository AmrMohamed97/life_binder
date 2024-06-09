import 'package:flutter/material.dart';
 import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/background_app_bar_image.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/custom_app_bar_flexible_space_detail.dart';
import 'package:note_app/features/search/view/search_view.dart';

class CustomPersonalAppBar extends StatelessWidget {
  const CustomPersonalAppBar({
    super.key,
    required this.cubit,
    required this.scaffoldKey,
  });
  final PersonInfoCubit cubit;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return   SliverAppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchView(
                      personCubit: cubit,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                size: 33,
              ),
            ),
          ],
          floating: false,
          pinned: true,
          elevation: 0,
          primary: true,
          shadowColor: const Color(0xffFFFFFF),
          snap: false,
          stretch: true,
          toolbarHeight: kToolbarHeight,
          collapsedHeight: kToolbarHeight,
          stretchTriggerOffset: 100,
          leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              size: 33,
            ),
          ),
          expandedHeight:
              MediaQuery.sizeOf(context).height * .23344652 + 20,
          flexibleSpace: FlexibleSpaceBar(
            title: SafeArea(
              child: CustomAppBarFlexableSpaceDetail(
                cubit: cubit,
              ),
            ),
            centerTitle: false,
            stretchModes: const [
              StretchMode.fadeTitle,
              StretchMode.blurBackground,
              StretchMode.zoomBackground
            ],
            background: const BackgroundAppBarImage(),
          ),
        );
     
  }
}
