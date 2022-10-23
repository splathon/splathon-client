import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SplaText("Home"),
      ),
      body: Center(
        child: SplaText('🦑 Not Implement yet 🦑'),
      ),
    );
  }
}
