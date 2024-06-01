import 'package:flutter/material.dart';
import 'package:note_app/core/widgets/custom_general_button.dart';

class OperationButtonLoading extends StatelessWidget {
  const OperationButtonLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}


