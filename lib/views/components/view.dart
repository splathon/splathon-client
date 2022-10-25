import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:splathon_app/views/components/rounded_view.dart';

Widget winloseView(MatchWinnerEnum? winner) {
  if (winner == null) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RoundedView.unreportedLabelView(),
        ]);
  }

  switch (winner) {
    case MatchWinnerEnum.alpha:
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RoundedView.accentWinView(),
            const SizedBox(
              width: 20.0,
            ),
            RoundedView.accentLoseView(),
          ]);

    case MatchWinnerEnum.bravo:
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RoundedView.accentLoseView(),
            const SizedBox(
              width: 20.0,
            ),
            RoundedView.accentWinView(),
          ]);
    case MatchWinnerEnum.draw:
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RoundedView.accentDarwView(),
          ]);
    default:
      // avoid lint error
      return Container();
  }
}
