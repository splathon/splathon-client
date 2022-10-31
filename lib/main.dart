import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splathon_app/firebase_options.dart';
import 'package:splathon_app/utils/preference.dart';
import 'package:splathon_app/views/login/login.dart';
import 'package:splathon_app/views/splash/splash.dart';
import 'package:splathon_app/views/tabs/admin_tabbed_bar.dart';
import 'package:splathon_app/views/tabs/home_tabbed_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize preference
  await Preference.setup();

  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Navigation with Routes',
        routes: <String, WidgetBuilder>{
          '/': (_) => const Splash(),
          '/login': (_) => Login(),
          '/home': (_) => const HomeTabbedBar(),
          '/admin': (_) => const AdminTabbedBar(),
        },
      ),
    ),
  );
}
