import 'package:flutter/material.dart';
import 'package:splathon_app/views/splash.dart';
import 'package:splathon_app/views/login.dart';
import 'package:splathon_app/views/hometabbedbar.dart';
import 'package:splathon_app/views/admintabbar.dart';
import 'package:splathon_app/utils/preference.dart';

void main() {
  // Initialize preference
  Preference();
  
  runApp(new MaterialApp(
    title: 'Navigation with Routes',
    routes: <String, WidgetBuilder>{
      '/': (_) => new Splash(),
      '/login': (_) => new Login(),
      '/home': (_) => new HomeTabbedBar(),
      '/admin': (_) => new AdminTabbedBar(),
    },
  ));
}
