import 'package:flutter/material.dart';

class PersonalPageLoadingAppBar extends StatelessWidget {
  const PersonalPageLoadingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * .26,
          width: MediaQuery.sizeOf(context).width,
          color: const Color(0xffE9E8E4),
        ),
        Positioned(
          bottom: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 43,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xffE9E8E4),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: MediaQuery.sizeOf(context).width * .5 - 20,
                height: 10,
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
        )
      ],
    );
  }
}
