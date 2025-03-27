// import 'package:note_app/core/utiles/functions/set_up.dart';
// import 'package:note_app/core/widgets/local_notification_services.dart';
// import 'package:workmanager/workmanager.dart';
//  import 'package:timezone/timezone.dart' as tz;

// class WorkManagerService {
//   Future<void> init() async {
//     await Workmanager().initialize(
//       action,
//       isInDebugMode: true,
//     ); //Before registering any task, the WorkManager plugin must be initialized.
//     //  registerOneTask();
//     await registerPeriodicTask();
//   }

//   Future<void> registerOneTask() async {
//     await Workmanager().registerOneOffTask(
//         'task-identifier' /*to be able to do collection of tasks*/,
//         'simplePeriodicTask' /*will be sent to dispatcher to  indicating the task's type. */);
//   }

//   Future<void> registerPeriodicTask() async {
//     await Workmanager().registerPeriodicTask(
//       'periodicId-cc',
//       'periodicTask',
//       frequency: const Duration(hours: 24),
//     );
//   }

//   void cancleTask(String id) {
//     Workmanager().cancelByUniqueName(id);
//   }
// }

// @pragma('vm:entry-point')
// void action() {
//   //The callbackDispatcher needs to be either a static function or a top level function to be accessible as a Flutter entry point.
//   Workmanager().executeTask((task, inputData) {
//     getIt.get<LocalNotificationServices>().sendScheduledNotification(
//       id: 0,
//       title: 'Time_waver',
//       body: 'You can use the app to schedule your day to make the most of it',
//       payload: 'daily',
//       scheduledDate: tz.TZDateTime(
//       tz.local,
//       DateTime.now().year,
//       DateTime.now().month,
//       DateTime.now().day,
//       9,
//     ),
//     );
//     return Future.value(true);
//   });
// }
