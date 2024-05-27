import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_image_cubit/personal_image_cubit.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_image_cubit/personal_image_state.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_cubit/get_user_name_cubit.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/change_image_page.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_image.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/user_name_widget.dart';

class CustomAppBarFlexableSpaceDetail extends StatelessWidget {
  const CustomAppBarFlexableSpaceDetail({
    super.key,
   });

   @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>PersonalImageCubit()..getPersonalImage(),
    child: BlocBuilder<PersonalImageCubit,PersonalImageState>(
      builder: (context, state) {
        var cubit=  BlocProvider.of<PersonalImageCubit>(context);
        return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeImagePage(
                  personalImage: cubit.personalImage,
                  image: cubit.personalImage.isEmpty
                      ? 'assets/images/3.png'
                      : cubit.personalImage,
                  folder: 'personal',
                ),
              ),
            );
          },
          child: PersonalImage(cubit: cubit),
        ),
        const UserNameWidget(),
      ],
    );
      }
    ),
    );
    
  }
}

