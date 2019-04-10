import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:english_words/english_words.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildNotifications();
  }

  Widget buildNotifications() {
    return new Column(
      children:<Widget>[
        new Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SplaText('お知らせ'),
        ),
        new Container(
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: borderColor,
              width: 1,
            )
          ),
          margin: const EdgeInsets.only(left: 20, right: 20),
          height: 55 * 5.0,
          child: new ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: borderDeepColor,
              height: 1,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (BuildContext context, i) {
              return new Container(
                height: 54.0,
                child: Center(
                  // TODO: ここでCustomViewを返す実装に変更する
                  child: new Text(generateWordPairs().take(1).first.asPascalCase),
                )
              );
            }
          ),
        ),
        new Expanded(
          child: Center(
            child: SplaText('余白!'),
          )
        )
      ]
    );
  }
}