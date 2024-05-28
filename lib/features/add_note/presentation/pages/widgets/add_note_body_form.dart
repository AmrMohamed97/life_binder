import 'package:awesome_dialog/awesome_dialog.dart';
 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
 import 'package:note_app/core/widgets/custom_general_button.dart';
import 'package:note_app/core/widgets/custom_text_field.dart';
import 'package:note_app/features/add_note/presentation/manager/add_note_cubit.dart';
import 'package:note_app/features/add_note/presentation/pages/widgets/show_bottom_sheet.dart';

class AddNoteBodyForm extends StatefulWidget {
  const AddNoteBodyForm({
    super.key,
    required this.titleController,
    required this.cubit,
    required this.noteController,
  });
  final TextEditingController titleController;
  final AddNoteCubit cubit;
  final TextEditingController noteController;

  @override
  State<AddNoteBodyForm> createState() => _AddNoteBodyFormState();
}

class _AddNoteBodyFormState extends State<AddNoteBodyForm> {
  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start:14,
          end: 14,
          top: 14,
          bottom: 14,
        ),
        child: Column(
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
            if(widget.cubit.file==null)
              Expanded(
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
              ),
    
            if(widget.cubit.file!=null)
              Expanded(
                child: Column(
                  children: [
                      const Text(
                        'Click to change picture',
                        style: TextStyle(
                          color: Color(0xff696969),
                        ),
                      ),
                    Expanded(
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
                    ),
                  ],
                ),
              ),
            CustomGeneralButton(
              verticalPadding:10,
              horizontalPadding: 1,
              height: 50*1.13,
              label:'Add Note',
              color: AppColors.blue,
              onTap: ()async{
                FocusScope.of(context).requestFocus(FocusNode());
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  if (widget.cubit.file != null) {
                    widget.cubit.uploadNote(context);
                  }
                  else{
                    AwesomeDialog(
                      context: context,
                      title: 'error',
                      body: const Text('must add Image'),
                    ).show();
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
