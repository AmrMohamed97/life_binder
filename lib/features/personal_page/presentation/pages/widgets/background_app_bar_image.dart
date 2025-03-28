import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/personal_page/presentation/manager/background_image_cubit/background_image_cubit.dart';
import 'package:note_app/features/personal_page/presentation/manager/background_image_cubit/background_image_state.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/change_image_page.dart';

class BackgroundAppBarImage extends StatelessWidget {
  const BackgroundAppBarImage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BackgroundImageCubit()..getBackgroundImage(),
      child: BlocBuilder<BackgroundImageCubit, BackgroundImageState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<BackgroundImageCubit>(context);
          return Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 80),
            child: GestureDetector(
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
                  ? Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/4.png',
                          ),
                        ),
                        const Positioned(
                          bottom: 20,
                          left: 20,
                          child: CircleAvatar(
                              radius: 14,
                              child: Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.black,
                                size: 16,
                              )),
                        )
                      ],
                    )
                  : Image.network(
                      cubit.backgroundImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
            ),
          );
        },
      ),
    );
  }
}
