import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/views/myresult.dart';
import 'package:splathon_app/views/Image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:english_words/english_words.dart';
import 'package:openapi/api.dart' as API;

class ResultDetail extends StatelessWidget { 
  final API.Match _match;

  ResultDetail(this._match);

  @override
  Widget build(BuildContext context) {
    return buildResultDetail(context);
  }

  Widget buildResultDetail(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
          bool isWinAlpha = battle.winner == 'alpha';
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
                      // margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                    Text(battle.stage.name, style: ruleStageStyle,),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0,),
                      width: 50,
                      height: 17.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: isWinAlpha ? winColor : loseColor,
                      ),
                      child: Center(
                        child: Text(isWinAlpha ? 'WIN' : 'LOSE', style: resultResultStyle),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Text(_match.teamAlpha.name, style: resultDetailTeamNameStyle,),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0,),
                      width: 50,
                      height: 17.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: isWinAlpha ? loseColor : winColor,
                      ),
                      child: Center(
                        child: Text(isWinAlpha ? 'LOSE' : 'WIN', style: resultResultStyle),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Text(_match.teamBravo.name, style: resultDetailTeamNameStyle,),
                  ],
                ),
              ],
            ),
          );
        }
      ),
    );
  }

  Widget winLoseTopView() {
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
              children: <Widget>[
                Center(child: Text(_match.teamAlpha.name, style: resultTopTeamNameStyle, maxLines: 2,),),
                Row(
                  children: <Widget>[
                    CharactorImage(_match.teamAlpha.members[0].icon),
                    Text(_match.teamAlpha.members[0].name, style: resultPlayerNameStyle),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CharactorImage(_match.teamAlpha.members[1].icon),
                    Text(_match.teamAlpha.members[1].name, style: resultPlayerNameStyle),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CharactorImage(_match.teamAlpha.members[2].icon),
                    Text(_match.teamAlpha.members[2].name, style: resultPlayerNameStyle),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CharactorImage(_match.teamAlpha.members[3].icon),
                    Text(_match.teamAlpha.members[3].name, style: resultPlayerNameStyle),
                  ],
                ),
              ],
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
              children: <Widget>[
                Text(_match.teamBravo.name, style: resultTopTeamNameStyle, maxLines: 2,),
                Row(
                  children: <Widget>[
                    CharactorImage(_match.teamBravo.members[0].icon),
                    Text(_match.teamBravo.members[0].name, style: resultPlayerNameStyle),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CharactorImage(_match.teamBravo.members[1].icon),
                    Text(_match.teamBravo.members[1].name, style: resultPlayerNameStyle),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CharactorImage(_match.teamBravo.members[2].icon),
                    Text(_match.teamBravo.members[2].name, style: resultPlayerNameStyle),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CharactorImage(_match.teamBravo.members[3].icon),
                    Text(_match.teamBravo.members[3].name, style: resultPlayerNameStyle),
                  ],
                ),
              ],
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