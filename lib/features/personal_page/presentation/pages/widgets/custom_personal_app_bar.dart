import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_cubit/get_user_name_cubit.dart';
 import 'package:note_app/features/personal_page/presentation/pages/widgets/background_app_bar_image.dart';
 import 'package:note_app/features/personal_page/presentation/pages/widgets/custom_app_bar_flexible_space_detail.dart';
 import 'package:note_app/features/personal_page/presentation/pages/widgets/sign_out.dart';
import 'package:note_app/core/routes/pages_keys.dart';

class CustomPersonalAppBar extends StatelessWidget {
  const CustomPersonalAppBar({
    super.key,
   });
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, PagesKeys.searchView);
          },
          icon: const Icon(
            Icons.search,
            color: AppColors.black,
          ),
        ),
        const SignOut(),
      ],
      floating: true,
      pinned: true,
      primary: true,
      snap: false,
      stretch: true,
      stretchTriggerOffset: 100,
      expandedHeight: MediaQuery.sizeOf(context).height * .23344652,
      flexibleSpace: FlexibleSpaceBar(
        title: SafeArea(
          child: IntrinsicHeight(
            child: CustomAppBarFlexableSpaceDetail(),
          ),
        ),
        centerTitle: false,
        stretchModes: const [
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
          StretchMode.zoomBackground
        ],
        background: BackgroundAppBarImage(),
      ),
    );
  }
}
