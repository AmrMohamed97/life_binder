import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/background_app_bar_image.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/custom_app_bar_flexible_space_detail.dart';
import 'package:note_app/core/routes/pages_keys.dart';

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
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.appColor,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, PagesKeys.searchView);
          },
          icon: const Icon(
            Icons.search,
            size: 28,
            color: AppColors.black,
          ),
        ),
      ],
      floating: true,
      pinned: true,
      primary: true,
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
      expandedHeight: MediaQuery.sizeOf(context).height * .23344652,
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
