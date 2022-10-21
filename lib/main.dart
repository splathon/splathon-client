import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splathon_app/utils/preference.dart';
import 'package:splathon_app/views/admintabbar.dart';
import 'package:splathon_app/views/hometabbedbar.dart';
import 'package:splathon_app/views/login.dart';
import 'package:splathon_app/views/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // Initialize preference
  Preference();

  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Navigation with Routes',
        routes: <String, WidgetBuilder>{
          '/': (_) => Splash(),
          '/login': (_) => Login(),
          '/home': (_) => HomeTabbedBar(),
          '/admin': (_) => AdminTabbedBar(),
        },
      ),
    ),
  );
}
