import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Config {
  static Config _singleton;
  SharedPreferences prefs;

  factory Config() {
    if (_singleton == null) {
      _singleton = new Config._internal();
    }
    return _singleton;
  }

  int eventNumber = 11;

  // Private constractor
  Config._internal();
}