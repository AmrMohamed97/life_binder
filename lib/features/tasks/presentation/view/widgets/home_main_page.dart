import 'package:flutter/material.dart';
import 'package:note_app/core/utiles/functions/set_up.dart';
import 'package:note_app/core/widgets/local_notification_services.dart';

class HomeMainPage extends StatelessWidget {
  const HomeMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('notifications'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: () async {
              await getIt.get<LocalNotificationServices>().sendScheduledNotification();
            },
            child: const Text('notify'),
          ),
        ],
      ),
    );
  }
}
