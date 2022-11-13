import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:splathon_app/firebase_options_splathon_11.dart';
import 'package:splathon_app/firebase_options_splathon_11_stg.dart';
import 'package:splathon_app/firebase_options_splathon_12.dart';

class Config {
  static String apiEventNumber =
      'v${const int.fromEnvironment('EVENT_NUMBER', defaultValue: 11)}';
  static String eventNumber =
      '${const int.fromEnvironment('EVENT_NUMBER', defaultValue: 11)}';
  static String splathonApiHost = dotenv.env['SPLATHON_API_BASE_DOMAIN'] ?? '';
  static String vapidKey =
      _vapidEnv.env['FIREBASE_CLOUD_MESSAGE_VAPID_KEY'] ?? '';
  static FirebaseOptions get firebaseOptions => _firebaseOptions;

  static final _vapidEnv = DotEnv();

  static loadFlavor() async {
    const flavor = String.fromEnvironment('FLAVOR');
    try {
      await dotenv.load(fileName: "env/dotEnv.$flavor");
      await _vapidEnv.load(fileName: "env/dotEnv.$_vapidEnvName");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static String get _vapidEnvName {
    const flavor = String.fromEnvironment('FLAVOR');
    if (flavor == 'prod' && eventNumber == 'v12') {
      return "spl12";
    } else if (flavor == 'prod' && eventNumber == 'v11') {
      return "spl11";
    } else {
      return "spl11stg";
    }
  }

  static FirebaseOptions get _firebaseOptions {
    const flavor = String.fromEnvironment('FLAVOR');
    if (flavor == 'prod' && eventNumber == 'v12') {
      return DefaultFirebaseOptionsSplathon12.currentPlatform;
    } else if (flavor == 'prod' && eventNumber == 'v11') {
      return DefaultFirebaseOptionsSplathon11.currentPlatform;
    } else {
      return DefaultFirebaseOptionsSplathon11Stg.currentPlatform;
    }
  }
}
