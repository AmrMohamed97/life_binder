import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/utiles/responsive/size_config.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_cubit/personal_page_cubit.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_cubit/personal_page_state.dart';
import 'package:note_app/features/personal_page/presentation/pages/personal_page_view.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_bottom_sheet.dart';

class ChangeImagePage extends StatelessWidget {
  const ChangeImagePage({
    super.key,
    required this.image,
    required this.folder,
    required this.personalImage,
  });
  final String image, folder, personalImage;
  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);
    return BlocConsumer<PersonalPageCubit, PersonalPageState>(
      listener: (context, state) {
        if (state is ImageDeletedSuccess) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const PersonalPageView(),
              ));
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<PersonalPageCubit>(context);
        return ModalProgressHUD(
          inAsyncCall: cubit.isLoading,
          child: Scaffold(
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,
                      color: AppColors.gray,
                      size: sizeConfig.defaultSize * 3.5)),
              actions: [
                if (personalImage.isNotEmpty)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.only(top: sizeConfig.defaultSize),
                    child: IconButton(
                        onPressed: () async {
                          await BlocProvider.of<PersonalPageCubit>(context)
                              .deletePersonalOrBackGroundImage(context,
                                  folder: folder);
                        },
                        icon: Icon(
                          Icons.delete,
                          size: sizeConfig.defaultSize * 4,
                          color: Colors.red,
                        )),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      end: sizeConfig.defaultSize * 1.5,
                      top: sizeConfig.defaultSize),
                  child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return PersonalBottomSheet(
                                  cubit: BlocProvider.of<PersonalPageCubit>(
                                      context),
                                  folder: folder);
                            });
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        size: sizeConfig.defaultSize * 4,
                        color: AppColors.gray,
                      )),
                ),
              ],
            ),
            body: personalImage
                    .isEmpty //-------------------------------------------
                ? Image.asset(
                    image,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                  )
                : Image.network(
                    personalImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
          ),
        );
      },
    );
  }
}
