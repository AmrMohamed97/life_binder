import 'package:flutter/material.dart';
import 'package:note_app/features/add_note/presentation/pages/widgets/show_bottom_sheet.dart';
import 'package:note_app/features/edit_note/presentation/manager/edit_note_cubit.dart';

class EditNoteImage extends StatelessWidget {
  const EditNoteImage({
    super.key,
    required this.cubit,
    required this.imageUrl,
  });

  final EditNoteCubit cubit;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const Text(
            'Click to change picture',
            style: TextStyle(
              color: Color(0xff696969),
            ),
          ),
          GestureDetector(
            onTap: () {
              FocusScope.of(context)
                  .requestFocus(FocusNode());
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ShowBottomSheet(cubit: cubit);
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    10),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: cubit.file!=null?Image.file(
                cubit.file!,
                fit: BoxFit.fill,
                width: double.infinity,
              ):Image.network(
              imageUrl,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            ),
          ),
        ],
      ),
    );
  }
}
