import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/views/roundedView.dart';
import 'package:english_words/english_words.dart';
import 'package:splathon_app/views/resultdetail.dart';
import 'dart:async';
import 'package:openapi/api.dart' as API;

class EachResult extends StatefulWidget {
  EachResult({Key key}) : super(key: key);

  @override
  _EachResultState createState() => _EachResultState();
}

class _EachResultState extends State<EachResult> with AutomaticKeepAliveClientMixin {
  API.Teams _model;
  API.Results _results;
  String dropdownValue = 'NuRItaclesカスタム'; // TODO: 暫定固定実装、ログイン処理実装して自身のTeamNameが取得できるようになったらここに入れる

  @override
  void initState() {
    super.initState();
    fetchTeams();
    fetchResult(84); // TODO: 暫定固定実装、ログイン処理実装して自身のTeamIDが取得できるようになったらここに入れる
  }

  @override
  bool get wantKeepAlive => true;

  Future fetchTeams() async {
    var client = new API.DefaultApi();
    var result = client.listTeams(9);
    result.then(
      (resultsObj) => setState(() { this._model = resultsObj; } )
    );
  }

  Future fetchResult(int teamId) async {
    var client = new API.ResultApi();
    var result = client.getResult(9, teamId: teamId);
    result.then(
      (resultsObj) => setState(() { this._results = resultsObj; } )
    );
  }

  void changedTeam(String teamName) {
    _model.teams.forEach((team) => 
      team.name == teamName ? fetchResult(team.id) : empty(),
    );
  }
  void empty() {}

  @override
  Widget build(BuildContext context) {
    return buildEachResult();
  }

  Widget buildEachResult() {
    if (_model == null || _results == null) {
      // Loading
      return new Center(
        child: const CircularProgressIndicator(),
      );
    }
    
    double screenWidth = MediaQuery.of(context).size.width;
    
    List<String> teamNames = _model.teams.map((team) => team.name).toList();
    final rounds = _results.qualifiers + _results.tournament;

    return Container(
      color: backgroundColor,
      child: ListView.builder(
        itemCount: rounds.length + 1,
        itemBuilder: (BuildContext context, i) {
          if (i == 0) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: borderblueColor,
                  width: 1,
                )
              ),
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              height: 72.0,
              width: 300.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 14),
                child: new DropdownButtonHideUnderline(
                  child: new DropdownButton(
                    value: dropdownValue,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                      changedTeam(newValue);
                    },
                    items: teamNames.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: topNameStyle),
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          }

          // SPEC: room, matchはRoundごとに各Team1つずつになる前提
          API.Round round = rounds[i - 1];
          API.Room room = round.rooms.first;
          API.Match match = room.matches.first;
          int order = match.order;

          return GestureDetector(
            onTap: () { 
              Navigator.push(context, new MaterialPageRoute<Null>(
                settings: const RouteSettings(name: "/result"),
                builder: (BuildContext context) => new ResultDetail(match.id),
              ));
            },
            child: new Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: borderblueColor,
                  width: 1,
                )
              ),
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              padding: const EdgeInsets.only(left: 14.0, right: 14.0),
              height: 82.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 14.0,
                          child: Text(round.name + " " + room.name + " 第$order試合", style: resultTitleStyle),
                          ),
                        Container(
                          height: 36.0,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(
                                width: screenWidth * 0.35,
                                child: Text(match.teamAlpha.name, style: resultNameStyle, maxLines: 1,),
                              ),
                              Text('vs', style: resultNameStyle),
                              SizedBox(
                                width: screenWidth * 0.35,
                                child: Text(match.teamBravo.name, style: resultNameStyle, maxLines: 1,),
                              ),                    
                            ],
                          ),
                        ),
                        winloseView(match.winner),
                      ],
                    ),
                  ),
                  Image.asset('assets/images/arrowRight.png')
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  Widget winloseView(String winner) {
    if (winner != 'alpha' && winner != 'bravo') {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            accentDarwView(),
          ]
        ),
      );
    }

    bool isWinAlpha = winner == 'alpha';

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          isWinAlpha ? accentWinView() : accentLoseView(),
          SizedBox(
            width: 20.0,
          ),
          isWinAlpha ? accentLoseView() : accentWinView(),
        ]
      ),
    );
  }

  static const TextStyle topNameStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: blackColor,
    fontSize: 22.0,
  );

  static const TextStyle resultTitleStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: grayColor,
    fontSize: 14.0,
  );

  static const TextStyle resultNameStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: blackColor,
    fontSize: 20.0,
  );

  static const TextStyle resultResultStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: Colors.white,
    fontSize: 11.0,
  );
}
