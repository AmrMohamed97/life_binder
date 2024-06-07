import 'package:flutter/material.dart';
 import 'package:note_app/core/constants/constances.dart';
import 'package:note_app/core/routes/pages_keys.dart';
import 'package:note_app/core/widgets/custom_general_button.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';
 import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_page_menu_item.dart';
import 'package:note_app/features/tasks/presentation/view/task_home_page.dart';

class PersonalPageOperationButton extends StatelessWidget {
  const PersonalPageOperationButton({
    super.key, required this.cubit,
  });
  final PersonInfoCubit cubit;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 11,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: CustomGeneralButton(
                  color: Colors.blue,
                  label: '  +  add note  ',
                  width: 110,
                  height: 35,
                  radius: 12,
                  onTap: () {
                    navigatorKey.currentState?.pushNamed(PagesKeys.addNotes);
                  },
                ),
              ),
              Flexible(
                child: CustomGeneralButton(
                    color: Colors.blue,
                    label: '  +  add task  ',
                    width: 110,
                    height: 35,
                    radius: 12,
                    onTap: ()  {
                        Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) => TaskHmoePage(personalImage: cubit.personalImage,userName: cubit.userName,) ));

                    }),
              ),
              Flexible(
                child: Container(
                  width: 60,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey,
                  ),
                  child: const PersonalPageMenuItem(),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
