import 'dart:async';

 import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationServices {
    FlutterLocalNotificationsPlugin
      flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
       
  Future<void> initialize() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings iosInitializationSettings =
        const DarwinInitializationSettings();
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onDidReceiveBackgroundNotificationResponse: (){},
      // onDidReceiveNotificationResponse: onTap,
    );
  }

  Future<void> sendBasicNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      '5',
      'Basic',
      importance: Importance.max,
      priority: Priority.high,
      // sound: RawResourceAndroidNotificationSound('sound.wav'.split('.').first),
    );
    NotificationDetails notificationDetail = NotificationDetails(
      android: androidNotificationDetails,
      iOS: const DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.show(
      5,
      'title',
      'body',
      notificationDetail,
      payload: 'item x',
    );
  }

  Future<void> sendPeriodicNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      '2',
      'Periodicly',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails notificationDetail = const NotificationDetails(
      android: androidNotificationDetails,
      iOS: DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'Periodicly',
      'body',
      RepeatInterval.everyMinute,
      notificationDetail,
      payload: 'item x',
    );
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
//--------------------------------------------------------------------------------------
  Future<void> sendScheduledNotification() async {
      AndroidNotificationDetails android = AndroidNotificationDetails(
      '3',
      'Scheduled',
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('sound.wav'.split('.').first),
    );
    NotificationDetails notificationDetails =  NotificationDetails(
      android: android,
      iOS:const DarwinNotificationDetails(),
    );
    tz.initializeTimeZones();
    print('==============TZ============');
    print(tz.local.toString());
    print('==============TZ============');
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    print(tz.local.name);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      'title',
      'body',
      tz.TZDateTime(
        tz.local,
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        DateTime.now().hour,
        DateTime.now().minute + 1,
        DateTime.now().second,
        DateTime.now().millisecond,
        DateTime.now().microsecond,
      ),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: 'item x',
    );
  }
}
