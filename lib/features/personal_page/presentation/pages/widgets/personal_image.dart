import 'package:flutter/material.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';

class PersonalImage extends StatelessWidget {
  const PersonalImage({
    super.key,
    required this.cubit,
    this.size = 'large',
  });

  final PersonInfoCubit cubit;
  final String? size;

  @override
  Widget build(BuildContext context) {
    return cubit.personalImage.isEmpty
        ? Stack(
            children: [
              const CircleAvatar(
                radius: 38,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/3.png'),
                ),
              ),
              if (size == 'large')
                const Positioned(
                  right: 0,
                  bottom: 0,
                  child:   CircleAvatar(
                      radius: 10,
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.black,
                        size: 13,
                      )),
                ),
            ],
          )
        : Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 38,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(cubit.personalImage),
                ),
              ),
              if (size == 'large')
                const Positioned(
                  right: 0,
                  bottom: 0,
                  child: CircleAvatar(
                      radius: 10,
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.black,
                        size: 13,
                      )),
                ),
            ],
          );
  }
}
