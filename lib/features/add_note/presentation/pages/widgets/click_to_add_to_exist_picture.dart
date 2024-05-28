import 'package:flutter/material.dart';
import 'package:note_app/features/add_note/presentation/pages/widgets/add_note_body_form.dart';
import 'package:note_app/features/add_note/presentation/pages/widgets/show_bottom_sheet.dart';

class ClickToAddToExistPicture extends StatelessWidget {
  const ClickToAddToExistPicture({
    super.key,
    required this.widget,
  });

  final AddNoteBodyForm widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
          showModalBottomSheet(
            context: context,
            builder: (context){
              return ShowBottomSheet(cubit: widget.cubit,);
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.file(widget.cubit.file!,fit: BoxFit.fill,width: double.infinity,)),
      ),
    );
  }
}