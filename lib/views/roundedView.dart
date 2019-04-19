import 'package:flutter/material.dart';
import 'package:splathon_app/styles/color.dart';

Widget accentNewView() {
  return accentLabelView(AccentLabelType.New);
}

Widget accentWinView() {
  return accentLabelView(AccentLabelType.Win);
}

Widget accentLoseView() {
  return accentLabelView(AccentLabelType.Lose);
}

Widget accentDarwView() {
  return accentLabelView(AccentLabelType.Draw);
}

Widget accentLabelView(AccentLabelType type) {
  return SizedBox(
    width: 40,
    height: 19,
    child: Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.0),
            color: accentColor(type),
          ),
        ),
        Center(
          child: Text(accentLabel(type), style: textStyle),
        ),
      ]
    ),
  );
}

Widget pointLabelView(int point) {
  return SizedBox(
    width: 40,
    height: 23,
    child: Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.0),
            color: Color.fromRGBO(206, 211, 225, 1.0),
          ),
        ),
        Center(
          child: Text((point).toString() + 'pt', style: pointStyle),
        ),
      ]
    ),
  );
}

enum AccentLabelType {
  New,
  Win,
  Lose,
  Draw,
}

String accentLabel(AccentLabelType type) {
  switch (type) {
    case AccentLabelType.New:
      return 'NEW';
    case AccentLabelType.Win:
      return 'WIN';
    case AccentLabelType.Lose:
      return 'LOSE';
    case AccentLabelType.Draw:
      return 'DRAW';
  }
}

Color accentColor(AccentLabelType type) {
  switch (type) {
    case AccentLabelType.New:
      return winColor;
    case AccentLabelType.Win:
      return winColor;
    case AccentLabelType.Lose:
      return loseColor;
    case AccentLabelType.Draw:
      return drawColor;
  }
}

const TextStyle textStyle = TextStyle(
  fontFamily: 'Splatfont',
  color: Colors.white,
  fontSize: 11.0,
);

const TextStyle pointStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: splaBlueColor,
    fontSize: 13.0,
  );