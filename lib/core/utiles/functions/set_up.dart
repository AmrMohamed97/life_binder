import 'package:get_it/get_it.dart';
import 'package:note_app/core/widgets/local_notification_services.dart';

final getIt = GetIt.instance;
void setUp() {
  getIt.registerSingleton<LocalNotificationServices>(LocalNotificationServices());
}
