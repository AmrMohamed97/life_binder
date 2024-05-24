import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/add_note/presentation/manager/add_note_cubit.dart';
import 'package:note_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_cubit.dart';
import 'package:note_app/features/routes/app_pages.dart';
import 'package:note_app/features/routes/pages_keys.dart';
import 'package:note_app/firebase_options.dart';
import 'core/constants/constances.dart';
import 'core/utiles/my_observer/my_observer.dart';
import 'features/edit_note/presentation/manager/edit_note_cubit.dart';

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
  Bloc.observer = MyObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit()),
        BlocProvider(create: (context) => EditNoteCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => PersonalPageCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppPages.routes,
        initialRoute:
            isLogin ? PagesKeys.personalPageView : PagesKeys.loginView,
      ),
    );
  }
}
