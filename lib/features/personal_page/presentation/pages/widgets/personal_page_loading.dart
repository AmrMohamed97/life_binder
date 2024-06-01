import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/widgets/custom_fading_widget.dart';
 import 'package:note_app/features/personal_page/presentation/pages/widgets/operation_button_loading.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_page_loading_app_bar.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_page_loading_body.dart';

class PersonalPageLoading extends StatelessWidget {
  const PersonalPageLoading({super.key});
   @override
  Widget build(BuildContext context) {
    return  CustomFadingWidget(
        child: ListView(
          children: const   [
            PersonalPageLoadingAppBar(),
        OperationButtonLoading(),
            PersonalPageLoadingBody(),
            PersonalPageLoadingBody(),
            PersonalPageLoadingBody(),
            PersonalPageLoadingBody(),
          ],
        ),
      );
  }
}