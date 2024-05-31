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
import 'package:note_app/features/add_note/presentation/pages/widgets/show_bottom_sheet.dart';
import 'package:note_app/features/edit_note/data/model/notes_model.dart';
import 'package:note_app/features/edit_note/presentation/manager/edit_note_cubit.dart';
import 'package:note_app/features/edit_note/presentation/manager/edit_note_state.dart';
import 'package:note_app/core/routes/pages_keys.dart';

class EditNotesBody extends StatefulWidget {
  const EditNotesBody({super.key, required this.noteModel});
  final NotesModel noteModel;

  @override
  State<EditNotesBody> createState() => _EditNotesBodyState();
}

class _EditNotesBodyState extends State<EditNotesBody> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final noteController = TextEditingController();
   @override
  void initState() {
         titleController.text=widget.noteModel.title;
         noteController.text= widget.noteModel.notes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);

    return BlocConsumer<EditNoteCubit, EditNoteState>(
      listener: (context, state) {
        var cubit =BlocProvider.of<EditNoteCubit>(context);
        if (state is EditDataLoadingState) {
          cubit.isLoading = true;
        } else if (state is EditDataSuccessState) {
          cubit.file = null;
           titleController.clear();
           noteController.clear();
          cubit.isLoading = false;
          Navigator.pushReplacementNamed(context, PagesKeys.personalPageView);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'your note updated success',
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
            duration: Duration(
              seconds: 3,
            ),
            backgroundColor: AppColors.lightGreen,
          ));
        } else if (state is EditDataErrorState) {
          cubit.isLoading = false;
        }
      },
      builder: (context, state) {
        var cubit=BlocProvider.of<EditNoteCubit>(context);
        return ModalProgressHUD(
          inAsyncCall: cubit.isLoading,
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: sizeConfig.defaultSize * 1.5,
                end: sizeConfig.defaultSize * 1.5,
                top: sizeConfig.defaultSize * 1.5,
                bottom: sizeConfig.defaultSize * .5,
              ),
              child: Column(
                children: [
                  CustomTextField(
                    controller: titleController,
                    onSaved: (val) {
                      cubit.title = val;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This Field is required';
                      }
                      return null;
                    },
                    textInputType: TextInputType.text,
                    maxLines: 1,
                    prefixIcon: const Icon(Icons.note),
                    hintText: 'Title Note',
                    maxLength: 30,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  ),
                  verticalHeight(sizeConfig.defaultSize),
                  CustomTextField(
                    controller: noteController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This Field is required';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      cubit.note = val;
                    },
                    textInputType: TextInputType.multiline,
                    maxLines: 5,
                    prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: sizeConfig.defaultSize * 1.2,
                          top: 0,
                          end: 0,
                          bottom: sizeConfig.defaultSize * 9),
                      child: const FaIcon(FontAwesomeIcons.message),
                    ),
                    hintText: 'Note',
                    maxLength: 200,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  ),
                  verticalHeight(sizeConfig.defaultSize),
                  if (cubit.file != null)
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
                                      sizeConfig.defaultSize),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.file(
                                  cubit.file!,
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (cubit.file == null)
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
                                      sizeConfig.defaultSize),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.asset('assets/images/addImage.PNG',width: double.infinity,),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  CustomGeneralButton(
                    verticalPadding: 10,
                    horizontalPadding: 1,
                    height: 50 * 1.13,
                    label: 'Edit Note',
                    color: AppColors.blue,
                    onTap: () async {
                      // FocusScope.of(context).requestFocus(FocusNode());
                      // if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        if (cubit.file ==null && cubit.title!.isEmpty && cubit.note!.isEmpty) {
                          AwesomeDialog(
                                  context: context,
                                  title: 'error',
                                  body: const Text('must add Note or Image'),
                                ).show();

        }else{
                          await cubit.updateData(
                              id: widget.noteModel.id, imageName: widget.noteModel.imageName);
                        }
                      // }
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
