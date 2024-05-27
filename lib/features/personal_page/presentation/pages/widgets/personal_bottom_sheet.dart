import 'package:flutter/material.dart';
 import 'package:note_app/core/utiles/responsive/size_config.dart';
import 'package:note_app/features/personal_page/presentation/pages/widgets/personal_bottom_sheet_form.dart';
 
class PersonalBottomSheet extends StatelessWidget {
  const PersonalBottomSheet({
    super.key,
    required this.cubit,
    required this.folder,
  });
  final dynamic cubit;
  final String folder;
  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);

    return   Container(
          height: sizeConfig.height200 + sizeConfig.height50,
          padding: EdgeInsets.all(sizeConfig.defaultSize * 2),
          child: PersonalBottomSheetForm(sizeConfig: sizeConfig, cubit: cubit, folder: folder),
        );
     
  }
}

