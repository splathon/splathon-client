import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splathon_app/firebase_options.dart';
import 'package:splathon_app/utils/preference.dart';
import 'package:splathon_app/views/admintabbar.dart';
import 'package:splathon_app/views/hometabbedbar.dart';
import 'package:splathon_app/views/login.dart';
import 'package:splathon_app/views/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize preference
  Preference();

  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Navigation with Routes',
        routes: <String, WidgetBuilder>{
          '/': (_) => const Splash(),
          '/login': (_) => Login(),
          '/home': (_) => HomeTabbedBar(),
          '/admin': (_) => AdminTabbedBar(),
        },
      ),
    ),
  );
}
