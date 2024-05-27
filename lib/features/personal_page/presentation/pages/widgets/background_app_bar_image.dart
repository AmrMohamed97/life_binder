import 'package:flutter/material.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_cubit/personal_page_cubit.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/change_image_page.dart';

class BackgroundAppBarImage extends StatelessWidget {
  const BackgroundAppBarImage({
    super.key,
    required this.cubit,
  });

  final PersonalPageCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeImagePage(
                    personalImage: cubit.backgroundImage,
                    image: 'assets/images/4.png',
                    folder: 'background')));
      },
      child: cubit.backgroundImage.isEmpty
          ? Image.asset(
              'assets/images/4.png',
            )
          : Image.network(
              cubit.backgroundImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
    );
  }
}