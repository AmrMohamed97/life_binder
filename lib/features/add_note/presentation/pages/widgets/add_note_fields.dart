import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/widgets/custom_text_field.dart';
import 'package:note_app/features/add_note/presentation/pages/widgets/add_note_body_form.dart';

class AddNoteFields extends StatelessWidget {
  const AddNoteFields({
    super.key,
    required this.widget,
  });

  final AddNoteBodyForm widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: widget.titleController,
          validator: (value){
            if(value!.isEmpty){
              return 'This Field is required';
            }
            return null;
          },
          onSaved: (val){
            widget.cubit.title=val;
          },
          textInputType: TextInputType.text,
          maxLines:1 ,
          prefixIcon: const Icon(Icons.note),
          hintText: 'Title Note',
          maxLength: 30,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
        ),
        const SizedBox(height: 10,),
        CustomTextField(
          controller: widget.noteController,
          validator: (value){
            if(value!.isEmpty){
              return 'This Field is required';
            }
            return null;
          },
          onSaved: (val){
            widget.cubit.note=val;
          },
          textInputType: TextInputType.multiline,
          maxLines: 5 ,
          prefixIcon:const  Padding(
            padding:   EdgeInsetsDirectional.only(
                start:12, top: 0, end: 0, bottom: 8),
            child:  FaIcon(FontAwesomeIcons.message),),
          hintText: 'Note',
          maxLength: 200,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
        ),
        const  SizedBox(height: 10,),
      ],
    );
  }
}
