import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/views/report.dart';
import 'package:splathon_app/views/Image.dart';
import 'package:splathon_app/views/roundedView.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:splathon_app/utils/preference.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:english_words/english_words.dart';
import 'package:openapi/api.dart' as API;

class ResultDetail extends StatefulWidget {
  final int _matchId;
  ResultDetail(this._matchId);

  @override
  _ResultDetailState createState() => _ResultDetailState(_matchId);
}

class _ResultDetailState extends State<ResultDetail> {
  final int _matchId;
  API.Match _match;

  _ResultDetailState(this._matchId);

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return buildResultDetail(context);
  }

  Future fetchData() async {
    var client = new API.MatchApi();
    var result = client.getMatch(Config().eventNumber, _matchId);
    result.then(
      (resultsObj) => setState(() { this._match = resultsObj; } )
    );
  }

  Widget buildResultDetail(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final bool isAdmin = Preference().isAdmin();

    if (_match == null) {
      // Loading
      return Scaffold(
        appBar: AppBar(
          title: SplaText('リザルト'),
          backgroundColor: Color.fromRGBO(11, 49, 143, 1),
        ),
        body: Center(
          child: const CircularProgressIndicator(),
        ),
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: SplaText('リザルト'),
        backgroundColor: Color.fromRGBO(11, 49, 143, 1),
      ),
      body: new ListView.builder(
        itemCount: _match.battles.length + 1,
        itemBuilder: (BuildContext context, i) {
          if (i == 0) {
            return Container(
              color: backgroundLightBlueColor,
              child: new Stack(
                children: <Widget>[
                  teamMemberView(screenWidth),
                  Container(
                    margin: const EdgeInsets.only(top: 0, left: 20, right: 20),
                    child: winLoseTopView(),
                  ),
                ],
              ),
            );
          }

          API.Battle battle = _match.battles[i - 1];
          final bool isNoId = battle.id == null;
          final bool isNoWinner = battle.winner == null;
          if (isNoId || isNoWinner) {
            if (!isAdmin) {
              return Container();
            }
            return Container(
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              foregroundDecoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: borderColor,
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      new Container(
                        width: 50,
                        child: new Stack(
                          children: <Widget>[
                            Image.asset('assets/images/silverInc.png'),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text('$i戦目', style: roundStyle),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8,),
                      isNoId ? SizedBox() : Text(battle.rule.name, style: ruleStageStyle,),
                      SizedBox(width: 8,),
                      isNoId ? SizedBox() : Text(battle.stage.name, style: ruleStageStyle,),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: RaisedButton(
                      color: splaYellowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))
                      ),
                      child: Text('結果を報告する',
                        style: TextStyle(
                          fontFamily: 'Splatfont',
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        await Navigator.push(context, new MaterialPageRoute<Null>(
                          settings: const RouteSettings(name: "/report"),
                          builder: (BuildContext context) => new Report(_match, battle),
                        ));
                        fetchData();
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          bool isWinAlpha = battle.winner == 'alpha';
          return GestureDetector(
            onTap: () async { 
              if (!isAdmin) {
                // Normal user can't show upcoming detail result
                return;
              }
              await Navigator.push(context, new MaterialPageRoute<Null>(
                settings: const RouteSettings(name: "/report"),
                builder: (BuildContext context) => new Report(_match, battle),
              ));
              fetchData();
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              foregroundDecoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: borderColor,
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      new Container(
                        width: 50,
                        child: new Stack(
                          children: <Widget>[
                            Image.asset('assets/images/silverInc.png'),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text('$i戦目', style: roundStyle),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8,),
                      Text(battle.rule.name, style: ruleStageStyle,),
                      SizedBox(width: 8,),
                      Text(battle.stage.name, style: ruleStageStyle,),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 2.0, right: 2.0,),
                        width: 50,
                        child: isWinAlpha ? accentWinView() : accentLoseView(),
                      ),
                      SizedBox(width: 8,),
                      Text(_match.teamAlpha.name, style: resultDetailTeamNameStyle,),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 2.0, right: 2.0,),
                        width: 50,
                        child: isWinAlpha ? accentLoseView() : accentWinView(),
                      ),
                      SizedBox(width: 8,),
                      Text(_match.teamBravo.name, style: resultDetailTeamNameStyle,),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  Widget winLoseTopView() {
    if (_match.winner == null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('UPCOMING', style: resultUpcomingStyle),
        ],
      );
    }
    if (_match.winner != 'alpha' && _match.winner != 'bravo') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('DRAW', style: resultDrawStyle),
        ],
      );
    }
    
    bool isWinAlpha = _match.winner == 'alpha';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        isWinAlpha ? Text('WIN', style: resultWinStyle) : Text('LOSE', style: resultLoseStyle),
        SizedBox(),
        isWinAlpha ? Text('LOSE', style: resultLoseStyle) : Text('WIN', style: resultWinStyle),
      ],
    );
  }

  Widget teamMemberView(double screenWidth) {
    final bool isNoMember = _match.teamAlpha.members.length < 4 || _match.teamBravo.members.length < 4;

    List<Widget> alphaMembers = isNoMember ?
      <Widget>[
        SizedBox(
          height: 50,
          child: Center(child: AutoSizeText(_match.teamAlpha.name, style: resultTopTeamNameStyle, maxLines: 1,),)
        ),
      ] :
      <Widget>[
        SizedBox(
          height: 50,
          child: Center(child: AutoSizeText(_match.teamAlpha.name, style: resultTopTeamNameStyle, maxLines: 1,),),
        ),
        Row(
          children: <Widget>[
            CharactorImage(_match.teamAlpha.members[0].icon),
            SizedBox(width: 5,),
            Text(_match.teamAlpha.members[0].name, style: resultPlayerNameStyle),
          ],
        ),
        Row(
          children: <Widget>[
            CharactorImage(_match.teamAlpha.members[1].icon),
            SizedBox(width: 5,),
            Text(_match.teamAlpha.members[1].name, style: resultPlayerNameStyle),
          ],
        ),
        Row(
          children: <Widget>[
            CharactorImage(_match.teamAlpha.members[2].icon),
            SizedBox(width: 5,),
            Text(_match.teamAlpha.members[2].name, style: resultPlayerNameStyle),
          ],
        ),
        Row(
          children: <Widget>[
            CharactorImage(_match.teamAlpha.members[3].icon),
            SizedBox(width: 5,),
            Text(_match.teamAlpha.members[3].name, style: resultPlayerNameStyle),
          ],
        ),
      ];
    List<Widget> bravoMembers = isNoMember ?
      <Widget>[
        SizedBox(
          height: 50,
          child: Center(child: AutoSizeText(_match.teamBravo.name, style: resultTopTeamNameStyle, maxLines: 1,),),
        ),
      ] :
      <Widget>[
        SizedBox(
          height: 50,
          child: Center(child: AutoSizeText(_match.teamBravo.name, style: resultTopTeamNameStyle, maxLines: 1,),),
        ),
        Row(
          children: <Widget>[
            CharactorImage(_match.teamBravo.members[0].icon),
            SizedBox(width: 5,),
            Text(_match.teamBravo.members[0].name, style: resultPlayerNameStyle),
          ],
        ),
        Row(
          children: <Widget>[
            CharactorImage(_match.teamBravo.members[1].icon),
            SizedBox(width: 5,),
            Text(_match.teamBravo.members[1].name, style: resultPlayerNameStyle),
          ],
        ),
        Row(
          children: <Widget>[
            CharactorImage(_match.teamBravo.members[2].icon),
            SizedBox(width: 5,),
            Text(_match.teamBravo.members[2].name, style: resultPlayerNameStyle),
          ],
        ),
        Row(
          children: <Widget>[
            CharactorImage(_match.teamBravo.members[3].icon),
            SizedBox(width: 5,),
            Text(_match.teamBravo.members[3].name, style: resultPlayerNameStyle),
          ],
        ),
      ];

    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
      padding: const EdgeInsets.only(top: 20, bottom: 15),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: screenWidth * 0.35,
            child: Column(
              children: alphaMembers,
            ),
          ),
          Container(
            color: borderColor,
            child: SizedBox(
              width: 1,
            ),
          ),
          Container(
            width: screenWidth * 0.35,
            child: Column(
              children: bravoMembers,
            ),
          ),
        ],
      ),
    );
  }

  static const TextStyle resultWinStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: winColor,
    fontSize: 40.0,
  );

  static const TextStyle resultLoseStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: loseColor,
    fontSize: 40.0,
  );

  static const TextStyle resultDrawStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: drawColor,
    fontSize: 40.0,
  );

  static const TextStyle resultUpcomingStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: splaYellowColor,
    fontSize: 40.0,
  );

  static const TextStyle resultTopTeamNameStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: blackColor,
    fontSize: 20.0,
  );

  static const TextStyle resultPlayerNameStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: blackColor,
    fontSize: 14.0,
  );

  static const TextStyle resultDetailTeamNameStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: blackColor,
    fontSize: 16.0,
  );

  static const TextStyle roundStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: splaBlueColor,
    fontSize: 18.0,
  );

  static const TextStyle ruleStageStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: grayColor,
    fontSize: 16.0,
  );

  static const TextStyle resultResultStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: Colors.white,
    fontSize: 11.0,
  );
}