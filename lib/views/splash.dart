import 'package:flutter/material.dart';
import 'package:splathon_app/utils/preference.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    // MEMO: Wait Preference initialized
    new Future.delayed(const Duration(milliseconds: 500))
      .then((value) => handleRouting());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: const CircularProgressIndicator(),
      ),
    );
  }

  void handleRouting() {
    String token = Preference().getToken();
    bool isAdmin = Preference().isAdmin();

    Navigator.of(context).pushReplacementNamed("/home");
    return;
    if (token == null) {
      Navigator.of(context).pushReplacementNamed("/login");
    } else if (isAdmin) {
      Navigator.of(context).pushReplacementNamed("/admin");
    } else {
      Navigator.of(context).pushReplacementNamed("/home");
    }    
  }
}