import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/views/roundedView.dart';
import 'package:splathon_app/views/Image.dart';
import 'package:english_words/english_words.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:splathon_app/utils/event.dart';
import 'dart:async';
import 'package:openapi/api.dart' as API;

class Rankings extends StatefulWidget {
  Rankings({Key key}) : super(key: key);

  @override
  _RankingsState createState() => _RankingsState();
}

class _RankingsState extends State<Rankings> with AutomaticKeepAliveClientMixin {
  // ViewModel
  API.Ranking _model;

  @override
  void initState() {
    super.initState();

    fetchData();
    listenReloadEvent();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return buildRankings();
  }

  Future fetchData() async {
    var client = new API.RankingApi();
    var result = client.getRanking(Config().eventNumber);
    result.then(
      (rankingObj) => setState(() { this._model = rankingObj; } )
    );
  }

  listenReloadEvent() async {
    Event().bus.on<RankingReload>().listen((_) {
      setState(() {
        _model = null;
        fetchData();
      });
    });
  }

  Widget buildRankings() {
    if (_model == null) {
      // Loading
      return new Center(
        child: const CircularProgressIndicator(),
      );
    }

    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: backgroundColor,
      child: ListView.builder(
        itemCount: _model.rankings.length * 2 + 1,
        itemBuilder: (BuildContext context, i) {
          if (i == 0) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 2, right: 20),
                  child: Text(_model.rankTime, style: timeStyle),
                ),                
              ],
            );
          }

          final index = (i - 1) ~/ 2;
          API.Rank rank = _model.rankings[index];
          if (i.isOdd) {
            return headerView(index, rank);
          }

          return new Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: borderColor,
                width: 1,
              )
            ),
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 75.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 36.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      memberView(getMember(rank.team.members, 0), screenWidth),
                      memberView(getMember(rank.team.members, 1), screenWidth),
                    ],
                  ),
                ),
                Container(
                  height: 36.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      memberView(getMember(rank.team.members, 2), screenWidth),
                      memberView(getMember(rank.team.members, 3), screenWidth),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  getMember(List<API.Member> members, int index) {
    if (members.length > index) {
      return members[index];
    }
    return null;
  }

  Widget headerView(int index, API.Rank rank) {
    final rankIndex = index + 1; // rankIndex: 1..N
    final isTop3 = rankIndex <= 3;
    return Container(
      margin: index == 0 ? const EdgeInsets.only(left: 20, right: 20) : const EdgeInsets.only(top: 12, left: 20, right: 20),
      height: 36.0,
      child: Row(
        children: <Widget>[
          isTop3 ? Image.asset('assets/images/crown$rankIndex.png') : SizedBox(),
          Padding(padding: const EdgeInsets.only(left: 4.0, right: 4.0), child: Text('$rankIndex位', style: rankTextStyle(rankIndex),),),
          Text(rank.team.name, style: rankTextStyle(rankIndex)),
          Expanded(
            child: Container(),
          ),
          Container(
            margin: const EdgeInsets.only(left: 6.0, bottom: 1),
            child: pointLabelView(rank.point),
          ),
        ],
      ),
    ); 
  }

  Widget memberView(API.Member member, double screenWidth) {
    if (member == null) {
      return Expanded(
        flex: 1,
        child: Container()
      );
    }

    final textWidth = (screenWidth / 2) - 65;

    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child :Row(
          children: <Widget>[
            CharactorImage(member.icon),
            SizedBox(
              width: 5,
            ),
            SizedBox(
              width: textWidth,
              child: AutoSizeText(member.name, style: nameStyle, maxLines: 1,),
            ),
          ],
        ),
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
  static const TextStyle timeStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: grayColor,
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