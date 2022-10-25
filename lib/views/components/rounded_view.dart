import 'package:flutter/material.dart';
import 'package:splathon_app/styles/color.dart';

class RoundedView {
  static Widget accentNewView() {
    return _accentLabelView(AccentLabelType.recent);
  }

  static Widget accentWinView() {
    return _accentLabelView(AccentLabelType.win);
  }

  static Widget accentLoseView() {
    return _accentLabelView(AccentLabelType.lose);
  }

  static Widget accentDarwView() {
    return _accentLabelView(AccentLabelType.draw);
  }

  static Widget pointLabelView(int point) {
    return SizedBox(
      width: 40,
      height: 23,
      child: Stack(children: [
        Container(
          margin: const EdgeInsets.only(top: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.0),
            color: const Color.fromRGBO(206, 211, 225, 1.0),
          ),
        ),
        Center(
          child: Text('${point}pt', style: pointStyle),
        ),
      ]),
    );
  }

  static Widget reportedLabelView() {
    return SizedBox(
      width: 54,
      height: 19,
      child: Stack(children: [
        Container(
          margin: const EdgeInsets.only(top: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.0),
            color: drawColor,
          ),
        ),
        const Center(
          child: Text('報告済み', style: textStyle),
        ),
      ]),
    );
  }

  static Widget unreportedLabelView() {
    return SizedBox(
      width: 65,
      height: 19,
      child: Stack(children: [
        Container(
          margin: const EdgeInsets.only(top: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.0),
            color: splaYellowColor,
          ),
        ),
        const Center(
          child: Text('UPCOMING', style: textStyle),
        ),
      ]),
    );
  }
}

Widget _accentLabelView(AccentLabelType type) {
  return SizedBox(
    width: 40,
    height: 19,
    child: Stack(children: [
      Container(
        margin: const EdgeInsets.only(top: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.0),
          color: _accentColor(type),
        ),
      ),
      Center(
        child: Text(_accentLabel(type), style: textStyle),
      ),
    ]),
  );
}

enum AccentLabelType {
  recent, // new is reserved
  win,
  lose,
  draw,
}

String _accentLabel(AccentLabelType type) {
  switch (type) {
    case AccentLabelType.recent:
      return 'NEW';
    case AccentLabelType.win:
      return 'WIN';
    case AccentLabelType.lose:
      return 'LOSE';
    case AccentLabelType.draw:
      return 'DRAW';
  }
}

Color _accentColor(AccentLabelType type) {
  switch (type) {
    case AccentLabelType.recent:
      return winColor;
    case AccentLabelType.win:
      return winColor;
    case AccentLabelType.lose:
      return loseColor;
    case AccentLabelType.draw:
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
