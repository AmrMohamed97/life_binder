import 'package:flutter/material.dart';
 import 'package:note_app/core/utiles/functions/set_up.dart';
import 'package:note_app/core/widgets/local_notification_services.dart';
 import 'package:timezone/timezone.dart' as tz;

class HomeMainPage extends StatelessWidget {
  const HomeMainPage({super.key});
  Future<void> check() async {
    
 
    var currentTime = tz.TZDateTime(
      tz.local,
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      DateTime.now().hour,
      DateTime.now().minute,
      DateTime.now().second,
      DateTime.now().millisecond,
      DateTime.now().microsecond,
    );
    var assignTime = tz.TZDateTime(
      tz.local,
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      DateTime.now().hour,
      DateTime.now().minute + 1,
      DateTime.now().second,
      DateTime.now().millisecond,
      DateTime.now().microsecond,
    );

    if (currentTime.isAfter(assignTime)) {
      print('current time is after assign time');
    }

    if (currentTime.isBefore(assignTime)) {
      print('current time is before assign time');
    }
  }

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
              await getIt
                  .get<LocalNotificationServices>()
                  .sendScheduledNotification(1);
              await getIt
                  .get<LocalNotificationServices>()
                  .sendScheduledNotification(3);
            },
            child: const Text('notify'),
          ),
          TextButton(
            onPressed: () async {

              await check();

            },
            child: const Text('test'),
          ),
        ],
      ),
    );
  }
}
