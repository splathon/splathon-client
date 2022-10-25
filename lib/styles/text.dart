import 'package:flutter/material.dart';

const splatStyle = TextStyle(
  fontFamily: 'Splatfont',
);

class SplaText extends Text {
  final String text;
  const SplaText(this.text, {super.key}) : super('');

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: splatStyle,
    );
  }
}
