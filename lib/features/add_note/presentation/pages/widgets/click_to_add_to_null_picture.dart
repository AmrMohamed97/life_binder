import 'package:flutter/material.dart';
import 'package:note_app/features/add_note/presentation/pages/widgets/add_note_body_form.dart';
import 'package:note_app/features/add_note/presentation/pages/widgets/show_bottom_sheet.dart';

class ClickToAddNullPicture extends StatelessWidget {
  const ClickToAddNullPicture({
    super.key,
    required this.widget,
  });

  final AddNoteBodyForm widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Text(
            'Click to add a picture',
            style: TextStyle(
              color: Color(0xffAFDBFE),
            ),
          ),
          GestureDetector(
            onTap: (){
                  FocusScope.of(context).requestFocus(FocusNode());
                  showModalBottomSheet(
                    context: context,
                    builder: (context){
                      return ShowBottomSheet(cubit: widget.cubit,);
                    },
                  );
            },
              child: Image.asset('assets/images/addImage.PNG',width: double.infinity,)),
        ],
      ),
    );
  }
}
