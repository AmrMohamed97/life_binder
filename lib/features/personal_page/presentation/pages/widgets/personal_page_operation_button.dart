import 'package:flutter/material.dart';
import 'package:note_app/core/widgets/custom_general_button.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_page_menu_item.dart';

class PersonalPageOperationButton extends StatelessWidget {
  const PersonalPageOperationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // const Divider(
          //   height: 1,
          // ),
          const SizedBox(
            height: 10,
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
                  onTap: () {},
                ),
              ),
              Flexible(
                child: CustomGeneralButton(
                  color: Colors.blue,
                  label: '  +  add task  ',
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
