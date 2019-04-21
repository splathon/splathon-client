import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static Preference _singleton;
  SharedPreferences prefs;

  factory Preference() {
    if (_singleton == null) {
      _singleton = new Preference._internal();
      _singleton.setup();
    }
    return _singleton;
  }

  setup() async {
    prefs = await SharedPreferences.getInstance();
  }

  String getToken() {
    return prefs.getString('Token');
  }

  setToken(String token) {
    prefs.setString('Token', token);
  }

  bool isAdmin() {
    return prefs.getBool('isAdmin');
  }

  setIsAdmin(bool isAdmin) {
    prefs.setBool('isAdmin', isAdmin);
  }

  // Private constractor
  Preference._internal();
}
