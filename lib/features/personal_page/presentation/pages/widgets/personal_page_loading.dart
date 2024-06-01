import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/widgets/custom_fading_widget.dart';
import 'package:note_app/core/widgets/custom_general_button.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_page_loading_app_bar.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_page_loading_body.dart';

class PersonalPageLoading extends StatelessWidget {
  const PersonalPageLoading({super.key});
  static const id = 'PersonalPageLoading';
  @override
  Widget build(BuildContext context) {
    return  CustomFadingWidget(
        child: ListView(
          children:   [
            PersonalPageLoadingAppBar(),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              height: 1,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: CustomGeneralButton(
                    color: Colors.blue,
                    label: '  ',
                    width: 110,
                    height: 35,
                    radius: 12,
                    onTap: () {},
                  ),
                ),
                Flexible(
                  child: CustomGeneralButton(
                    color: Colors.blue,
                    label: '   ',
                    width: 110,
                    height: 35,
                    radius: 12,
                    onTap: () {},
                  ),
                ),
                Flexible(
                  child: Container(
                    width: 60,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey,
                    ),
                    child: const Icon(Icons.more_horiz),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
            PersonalPageLoadingBody(),
            PersonalPageLoadingBody(),
            PersonalPageLoadingBody(),
            PersonalPageLoadingBody(),
          ],
        ),
      );
  }
}


