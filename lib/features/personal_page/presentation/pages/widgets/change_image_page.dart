import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
 import 'package:note_app/core/utiles/functions/custom_snack_bar.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_change_image_cubit/personal_page_change_image_cubit.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_change_image_cubit/personal_page_change_image_state.dart';
import 'package:note_app/features/personal_page/presentation/pages/personal_page_view.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/change_image_page_body.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/custom_change_image_app_bar.dart';

class ChangeImagePage extends StatefulWidget {
  const ChangeImagePage({
    super.key,
    required this.image,
    required this.folder,
    required this.personalImage,
  });
  final String image, folder, personalImage;

  @override
  State<ChangeImagePage> createState() => _ChangeImagePageState();
}

class _ChangeImagePageState extends State<ChangeImagePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalPageChangeImageCubit(),
      child: BlocConsumer<PersonalPageChangeImageCubit,
          PersonalPageChangeImageStates>(
        listener: (context, state) {
          if (state is ImageDeletedSuccess) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PersonalPageView(),
                ));
          } else if (state is AddPersonalOrBackgroundImageSuccess) {
             showSnakBar(context: context, message: 'your image uploaded success');
             Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PersonalPageView(),
                ));
          } else if (state is ChangeLoadState) {
            setState(() {
              Navigator.pop(context);
            });
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<PersonalPageChangeImageCubit>(context);
          return AbsorbPointer(
            absorbing: cubit.isLoading,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: ModalProgressHUD(
                inAsyncCall: cubit.isLoading,
                child: Scaffold(
                  appBar: CustomChangeImageAppBar(
                      personalImage: widget.personalImage,
                      folder: widget.folder,
                      cubit: cubit),
                  body: ChangeImagePageBody(
                    image: widget.image,
                    folder: widget.folder,
                    personalImage: widget.personalImage,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
