import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:english_words/english_words.dart';
import 'dart:async';
import 'package:openapi/api.dart';

class Rankings extends StatefulWidget {
  Rankings({Key key}) : super(key: key);

  @override
  _RankingsState createState() => _RankingsState();
}

class _RankingsState extends State<Rankings> {
  @override
  Widget build(BuildContext context) {
    fetchData();
    return buildRankings();
  }

  Ranking _model;

  Future fetchData() async {
    var client = new RankingApi();
    var result = client.getRanking(9);
    result.then(
      (rankingObj) => setState(() { this._model = rankingObj; } )
    );
  }

  Widget buildRankings() {
    if (_model == null) {
      // Loading
      return new Center(
        child: const CircularProgressIndicator(),
      );
    }

    return new ListView.builder(
      itemCount: _model.rankings.length * 2,
      itemBuilder: (BuildContext context, i) {
        if (!i.isOdd) {
          final index = i ~/ 2;
          Rank rank = _model.rankings[index];
          return headerView(index, rank);
        }
        return new Container(
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: borderColor,
              width: 1,
            )
          ),
          color: Colors.white,
          margin: const EdgeInsets.only(left: 20, right: 20),
          height: 72.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 36.0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.sentiment_very_satisfied,
                          color: Colors.red,
                        ),
                        Text('Player A-A-A-A', style: nameStyle),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.blue,
                        ),
                        Text('Player B-B-B-B', style: nameStyle),
                      ],
                    ),                  ],
                ),
              ),
              Container(
                height: 36.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.sentiment_neutral,
                          color: Colors.lightGreen,
                        ),
                        Text('Player C-C-C-C', style: nameStyle),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.orange,
                        ),
                        Text('Player D-D-D-D', style: nameStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  Widget headerView(int index, Rank rank) {
    final rankIndex = index + 1; // rankIndex: 1..N
    final isTop3 = rankIndex <= 3;
    return Container(
      margin: const EdgeInsets.only(top: 12, left: 20, right: 20),
      height: 36.0,
      child: Row(
        children: <Widget>[
          isTop3 ? Image.asset('assets/images/crown$rankIndex.png') : SizedBox(),
          Padding(padding: const EdgeInsets.only(left: 4.0, right: 4.0), child: Text('$rankIndex位', style: rankTextStyle(rankIndex),),),
          Text(rank.team.name, style: rankTextStyle(rankIndex)),
          Container(
            margin: const EdgeInsets.only(left: 6),
            padding: const EdgeInsets.only(left: 10.0, right: 10.0,),
            height: 20.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromRGBO(206, 211, 225, 1.0),
            ),
            child: Text((rank.point).toString() + 'pt', style: pointStyle),
          ),
        ],
      ),
    ); 
  }

  static const TextStyle pointStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: splaBlueColor,
    fontSize: 13.0,
  );
  static const TextStyle nameStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: blackColor,
    fontSize: 14.0,
  );

  TextStyle rankTextStyle(int index) {
    return TextStyle(
      fontFamily: 'Splatfont',
      color: rankTextColor(index),
      fontSize: 18.0,
    );
  }
  
  Color rankTextColor(int index) {
    switch (index) {
      case 1:
        return Color.fromRGBO(187, 150, 0, 1.0);
      case 2:
        return Color.fromRGBO(120, 130, 154, 1.0);
      case 3:
        return Color.fromRGBO(188, 130, 89, 1.0);
      default:
        return blackColor;
    }
  }
}

// TODO: ユーザアイコンと名前のView部分はここで定義して突っ込むようにしたい
class RankingCard extends Card {
  String name;
  String imageUrl;
  RankingCard(this.name, this.imageUrl);

  @override 
  Widget build(BuildContext context) {
    return Card(

    );
  }
}