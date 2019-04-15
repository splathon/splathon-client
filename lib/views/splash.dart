import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    // 通信処理未実装なのでとりあえず1秒のSplash
    new Future.delayed(const Duration(seconds: 1))
        .then((value) => handleTimeout());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        // TODO: Implement splash animation
        child: const CircularProgressIndicator(),
      ),
    );
  }

  void handleTimeout() {
    Navigator.of(context).pushReplacementNamed("/login");
  }
}