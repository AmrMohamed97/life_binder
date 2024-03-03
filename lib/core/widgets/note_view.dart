import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors/app_colors.dart';
import 'package:note_app/core/utiles/responsive/size_config.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key, required this.imageUrl, required this.title, required this.note});
  final String imageUrl,title,note;
  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig=SizeConfig(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){Navigator.pop(context);},
            icon: const Icon(Icons.arrow_back_rounded,color: Colors.grey ,)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(sizeConfig.defaultSize*1.2),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.red,
                fontSize: sizeConfig.defaultSize*2.5
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: sizeConfig.defaultSize*1.2),
            child: Text(
              note,
              style: TextStyle(
                 color: AppColors.lightGreen,
                  fontSize: sizeConfig.defaultSize*1.8,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(vertical: sizeConfig.defaultSize),
          )
        ],
      ),
    );
  }
}
