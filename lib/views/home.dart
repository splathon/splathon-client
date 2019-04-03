import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: SplaText("Home"),
      ),
      body: new Center(
        child: SplaText('🦑 Not Implement yet 🦑'),
      ),
    );
  }
}