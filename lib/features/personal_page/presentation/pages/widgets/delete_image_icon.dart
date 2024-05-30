import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_change_image_cubit/personal_page_change_image_cubit.dart';

class DeleteImageIcon extends StatelessWidget {
  const DeleteImageIcon({
    super.key,
     required this.folder,
  });

   final String folder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          top: 10),
      child: IconButton(
          onPressed: () async {
            await BlocProvider.of<PersonalPageChangeImageCubit>(
                    context)
                .deletePersonalOrBackGroundImage(context,
                    folder: folder);
          },
          icon: const Icon(
            Icons.delete,
            size: 40,
            color: Colors.red,
          )),
    );
  }
}
