import 'package:flutter/material.dart';

class PersonalPageLoadingBody extends StatelessWidget {
  const PersonalPageLoadingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          color: Colors.grey,
          height: 10,
          thickness: 8,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(width: 16),
            const CircleAvatar(
              backgroundColor: Color(0xffE9E8E4),
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * .5 - 20,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffE9E8E4),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * .5 - 20,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffE9E8E4),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        AspectRatio(
          aspectRatio: 2,
          child: Container(
            color: const Color(0xffE9E8E4),
          ),
        ),
      ],
    );
  }
}
