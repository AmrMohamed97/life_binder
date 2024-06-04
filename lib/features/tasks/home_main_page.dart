import 'package:flutter/material.dart';
import 'package:note_app/features/tasks/navigate_to_menu_widget.dart';

class HomeMainPage extends StatelessWidget {
  const HomeMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Tasks'),
        leading: const NavigateToMenuWidget(),
      ),
    );
  }
}