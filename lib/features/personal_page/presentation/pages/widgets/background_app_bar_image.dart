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
    return BlocProvider(create: (context)=>BackgroundImageCubit(),
    child: BlocBuilder<BackgroundImageCubit,BackgroundImageState>(
      builder: (context,state){
        var cubit = BlocProvider.of<BackgroundImageCubit>(context);
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
      },
    ),
    );
    
  }
}