class Config {
  static final Config _singleton = Config._internal();
  // Private constractor
  Config._internal();
  factory Config() {
    return _singleton;
  }

  // static Config _singleton;
  // SharedPreferences prefs;

  // factory Config() {
  //   if (_singleton == null) {
  //     _singleton = new Config._internal();
  //   }
  //   return _singleton;
  // }

  int eventNumber = 11;

  // // Private constractor
  // Config._internal();
}
