import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String eventNumber =
      'v${const int.fromEnvironment('EVENT_NUMBER', defaultValue: 11)}';
  static String splathonApiHost = dotenv.env['SPLATHON_API_BASE_DOMAIN'] ?? '';

  static loadFlavor() async {
    const flavor = String.fromEnvironment('FLAVOR');
    try {
      await dotenv.load(fileName: "env/dotEnv.$flavor");
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
