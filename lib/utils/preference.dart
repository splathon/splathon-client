import 'package:shared_preferences/shared_preferences.dart';
import 'package:splathon_app/utils/config.dart';

class Preference {
  static final Preference _singleton = Preference._internal();
  Preference._internal();

  late SharedPreferences _prefs;

  static setup() async {
    _singleton._prefs = await SharedPreferences.getInstance();
  }

  static String getToken() {
    return _singleton._prefs.getString('Token${Config.eventNumber}') ?? '';
  }

  static setToken(String token) {
    _singleton._prefs.setString('Token${Config.eventNumber}', token);
  }

  static bool isAdmin() {
    return _singleton._prefs.getBool('isAdmin') ?? false;
  }

  static setIsAdmin(bool isAdmin) {
    _singleton._prefs.setBool('isAdmin', isAdmin);
  }

  static int? getTeamId() {
    return _singleton._prefs.getInt('TeamId');
  }

  static setTeamId(int teamId) {
    _singleton._prefs.setInt('TeamId', teamId);
  }

  static String? getTeamName() {
    return _singleton._prefs.getString('TeamName');
  }

  static setTeamName(String teamName) {
    _singleton._prefs.setString('TeamName', teamName);
  }

  static int getNoticeReadTime() {
    return _singleton._prefs.getInt('NoticeReadTime') ?? 0;
  }

  static setNoticeReadTime(int unixTime) {
    _singleton._prefs.setInt('NoticeReadTime', unixTime);
  }
}
