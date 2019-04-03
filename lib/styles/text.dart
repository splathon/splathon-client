import 'package:flutter/material.dart';

const splatStyle = const TextStyle(
  fontFamily: 'Splatfont',
);

class SplaText extends Text {
  String text;
  SplaText(this.text) : super('');

  @override 
  Widget build(BuildContext context) {
    return Text(text, style: splatStyle,);
  }
}