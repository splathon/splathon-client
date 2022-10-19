import 'package:flutter/material.dart';
import 'package:splathon_app/utils/preference.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    // MEMO: Wait Preference initialized
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => handleRouting());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void handleRouting() {
    String token = Preference().getToken();
    bool isAdmin = Preference().isAdmin();

    print('token: $token isAdmin: $isAdmin');

    if (token.isEmpty) {
      Navigator.of(context).pushReplacementNamed("/login");
    } else if (isAdmin) {
      Navigator.of(context).pushReplacementNamed("/admin");
    } else {
      Navigator.of(context).pushReplacementNamed("/home");
    }
  }
}
