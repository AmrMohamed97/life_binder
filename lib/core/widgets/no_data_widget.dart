 import 'package:flutter/material.dart';
 import 'package:note_app/core/utiles/functions/functions.dart';
import 'package:note_app/core/utiles/responsive/size_config.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig=SizeConfig(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(
                Icons.edit_note,
                size: sizeConfig.defaultSize*4,
              ),
            ],
            ),
          verticalHeight(sizeConfig.defaultSize),
          const Text(
            'There is no notes ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text('Please add some data to display'),
        ],
       ) ;
  }
}
