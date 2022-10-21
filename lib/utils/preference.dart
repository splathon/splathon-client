import 'package:shared_preferences/shared_preferences.dart';
import 'package:splathon_app/utils/config.dart';

class Preference {
  static final Preference _singleton = Preference._internal();
  // Private constractor
  Preference._internal() {
    setup();
  }
  factory Preference() {
    return _singleton;
  }
  late SharedPreferences prefs;

  setup() async {
    prefs = await SharedPreferences.getInstance();
  }

  String getToken() {
    return prefs.getString('Token${Config.eventNumber}') ?? '';
  }

  setToken(String token) {
    prefs.setString('Token${Config.eventNumber}', token);
  }

  bool isAdmin() {
    return prefs.getBool('isAdmin') ?? false;
  }

  setIsAdmin(bool isAdmin) {
    prefs.setBool('isAdmin', isAdmin);
  }

  int getTeamId() {
    return prefs.getInt('TeamId') ?? 0;
  }

  setTeamId(int teamId) {
    prefs.setInt('TeamId', teamId);
  }

  String getTeamName() {
    return prefs.getString('TeamName') ?? '';
  }

  setTeamName(String teamName) {
    prefs.setString('TeamName', teamName);
  }

  int getNoticeReadTime() {
    return prefs.getInt('NoticeReadTime') ?? 0;
  }

  setNoticeReadTime(int unixTime) {
    prefs.setInt('NoticeReadTime', unixTime);
  }
}
