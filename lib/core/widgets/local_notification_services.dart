 
 
  import 'package:flutter_local_notifications/flutter_local_notifications.dart';
    // import 'package:timezone/browser.dart';
// import 'package:flutter_timezone/flutter_timezone.dart';
//  import 'package:timezone/timezone.dart' as tz;
//  void onTap(NotificationResponse notifyResponse) {
 
// }
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
      // onDidReceiveBackgroundNotificationResponse:onTap,
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
      'Time_waver',
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

  Future<void> cancelNotification({required int id}) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
  
//--------------------------------------------------------------------------------------
  Future<void> sendScheduledNotification({required int id,required String title,required String body ,required   scheduledDate,String? payload}) async {
      AndroidNotificationDetails android = AndroidNotificationDetails(
      '3',
      'schedule',
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('sound.wav'.split('.').first),
    );
    NotificationDetails notificationDetails =  NotificationDetails(
      android: android,
      iOS:const DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: payload,
    );
  }
    //---------------------
//   Future<void> sendDailyNotification() async {
//     const AndroidNotificationDetails android = AndroidNotificationDetails(
//       '0',
//       'daily',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     NotificationDetails notificationDetails = const NotificationDetails(
//       android: android,
//       iOS: DarwinNotificationDetails(),
//     );
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'Time_Waver',
//       'You can use the app to schedule your day to make the most of it',
//       tz.TZDateTime(
//         tz.local,
//         DateTime.now().year,
//         DateTime.now().month,
//         DateTime.now().day,
//         9,
        
//       ),
//       notificationDetails,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       payload: 'daily',
//     );
//   }
}
 