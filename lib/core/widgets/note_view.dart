import 'package:flutter/material.dart';
 
class NoteView extends StatelessWidget {
  const NoteView({super.key, required this.imageUrl});
  final String imageUrl ;
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(child: Image.network(imageUrl));
  }
}
