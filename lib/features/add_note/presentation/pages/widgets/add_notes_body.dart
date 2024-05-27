import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/utiles/functions/functions.dart';
import 'package:note_app/core/utiles/responsive/size_config.dart';
import 'package:note_app/core/widgets/custom_general_button.dart';
import 'package:note_app/core/widgets/custom_text_field.dart';
import 'package:note_app/features/add_note/presentation/manager/add_note_cubit.dart';
import 'package:note_app/features/add_note/presentation/manager/add_note_state.dart';
import 'package:note_app/features/add_note/presentation/pages/widgets/show_bottom_sheet.dart';
import 'package:note_app/core/routes/pages_keys.dart';

class AddNotesBody extends StatelessWidget {
    AddNotesBody({super.key});
    final formKey=GlobalKey<FormState>();
    final titleController=TextEditingController();
    final noteController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig=SizeConfig(context);
    var cubit=BlocProvider.of<AddNoteCubit>(context);
    return BlocConsumer<AddNoteCubit,AddNoteState>(
      listener: (context,state){
        if(state is NoteUploadLoading){
          cubit.isLoading=true;
        }else if(state is NoteUploadedSuccess){
          cubit.file=null;
          titleController.clear();
          noteController.clear();
          cubit.isLoading=false;
          Navigator.pushNamed(context, PagesKeys.personalPageView);
        }else if(state is NoteUploadError){
          cubit.isLoading=false;
        }
      },
      builder: (context,state){
        return ModalProgressHUD(
          inAsyncCall: cubit.isLoading,
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start:sizeConfig.defaultSize *1.5,
                end: sizeConfig.defaultSize *1.5,
                top: sizeConfig.defaultSize *1.5,
                bottom: sizeConfig.defaultSize * .5,
              ),
              child: Column(
                children: [
                  CustomTextField(
                    controller: titleController,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'This Field is required';
                      }
                      return null;
                    },
                    onSaved: (val){
                      cubit.title=val;
                    },
                    textInputType: TextInputType.text,
                    maxLines:1 ,
                    prefixIcon: const Icon(Icons.note),
                    hintText: 'Title Note',
                    maxLength: 30,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  ),
                  verticalHeight(sizeConfig.defaultSize),
                  CustomTextField(
                    controller: noteController,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'This Field is required';
                      }
                      return null;
                    },
                    onSaved: (val){
                      cubit.note=val;
                    },
                    textInputType: TextInputType.multiline,
                    maxLines: 5 ,
                    prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start:sizeConfig.defaultSize*1.2, top: 0, end: 0, bottom: sizeConfig.defaultSize*9),
                      child:const FaIcon(FontAwesomeIcons.message),),
                    hintText: 'Note',
                    maxLength: 200,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  ),
                  verticalHeight(sizeConfig.defaultSize),
                  if(cubit.file==null)
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
                                      return ShowBottomSheet(cubit: cubit,);
                                    },
                                  );
                            },
                              child: Image.asset('assets/images/addImage.PNG',width: double.infinity,)),
                        ],
                      ),
                    ),

                  if(cubit.file!=null)
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
                                    return ShowBottomSheet(cubit: cubit,);
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(sizeConfig.defaultSize),
                                ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.file(cubit.file!,fit: BoxFit.fill,width: double.infinity,)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  CustomGeneralButton(
                    verticalPadding: sizeConfig.height10,
                    horizontalPadding: sizeConfig.width1,
                    height: sizeConfig.height50*1.13,
                    label:'Add Note',
                    color: AppColors.blue,
                    onTap: ()async{
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        if (cubit.file != null) {
                          cubit.uploadNote(context);
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
          ),
        );
      },
    );
  }
}
