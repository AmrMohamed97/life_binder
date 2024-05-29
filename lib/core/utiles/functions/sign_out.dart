import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_app/core/constants/constances.dart';
import 'package:note_app/core/routes/pages_keys.dart';

Future<void> signOut() async {
    await FirebaseAuth.instance.signOut().then((value) {
      navigatorKey.currentState
          ?.pushReplacementNamed(PagesKeys.loginView);
    });
  }