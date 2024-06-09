import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:note_app/core/utiles/cache_helper.dart';
import 'package:note_app/core/utiles/functions/set_up.dart';
import 'package:note_app/core/widgets/local_notification_services.dart';
import 'package:note_app/core/widgets/work_manager_service.dart';
import 'package:note_app/features/add_note/presentation/manager/add_note_cubit.dart';
import 'package:note_app/features/auth/presentation/manager/app_theme_cubit/app_theme_cubit.dart';
import 'package:note_app/features/auth/presentation/manager/app_theme_cubit/app_theme_state.dart';
import 'package:note_app/features/auth/presentation/manager/register_cubit.dart';
import 'package:note_app/core/routes/app_pages.dart';
import 'package:note_app/core/routes/pages_keys.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';
import 'package:note_app/firebase_options.dart';
import 'core/constants/constances.dart';
import 'core/utiles/my_observer/my_observer.dart';
import 'features/edit_note/presentation/manager/edit_note_cubit.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (FirebaseAuth.instance.currentUser == null) {
    isLogin = false;
  } else {
    isLogin = true;
  }
  setUp();
  print('================allow notification appear=================');
  await initNotification();
  print('===============initialize local notification==============');
  await getIt.get<LocalNotificationServices>().initialize();
  tz.initializeTimeZones();
  final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(currentTimeZone));
  await getIt.get<CacheHelper>().init();
  getIt.get<CacheHelper>().saveData(key: 'notificationId', value: 1);
  await WorkManagerService().init();
  Bloc.observer = MyObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppThemeCubit()),
        BlocProvider(create: (context) => AddNoteCubit()),
        BlocProvider(create: (context) => EditNoteCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => PersonInfoCubit()),
      ],
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: BlocProvider.of<AppThemeCubit>(context).isDark?ThemeData.dark():ThemeData.light(),
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            routes: AppPages.routes,
            initialRoute:
                //  PagesKeys.taskHomePage,
                isLogin ? PagesKeys.personalPageView : PagesKeys.loginView,
          );
        },
      ),
    );
  }
}

Future<void> initNotification() async {
  await FirebaseMessaging.instance.requestPermission();
}
