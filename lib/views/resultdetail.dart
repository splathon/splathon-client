import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/views/myresult.dart';
import 'package:english_words/english_words.dart';

class ResultDetail extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return buildResultDetail(context);
  }

  Widget buildResultDetail(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return new ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, i) {
        if (i == 0) {
          return Container(
            color: backgroundBlueColor,
            child: new Stack(
              children: <Widget>[
                Container(
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
                            Center(child: Text('AplatoonZZZからあげ定食', style: resultTopTeamNameStyle, maxLines: 2,),),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.sentiment_neutral,
                                  color: Colors.lightGreen,
                                ),
                                Text(generateWordPairs().take(1).first.asPascalCase, style: resultPlayerNameStyle),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.sentiment_very_satisfied,
                                  color: Colors.red
                                ),
                                Text(generateWordPairs().take(1).first.asPascalCase, style: resultPlayerNameStyle),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.sentiment_very_dissatisfied,
                                  color: Colors.blue,
                                ),
                                Text(generateWordPairs().take(1).first.asPascalCase, style: resultPlayerNameStyle),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.sentiment_satisfied,
                                  color: Colors.orange,
                                ),
                                Text(generateWordPairs().take(1).first.asPascalCase, style: resultPlayerNameStyle),
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
                            Text('AplatoonZZZからあげ定食dfdfadfdafsfasf', style: resultTopTeamNameStyle, maxLines: 2,),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.sentiment_neutral,
                                  color: Colors.lightGreen,
                                ),
                                Text(generateWordPairs().take(1).first.asPascalCase, style: resultPlayerNameStyle),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.sentiment_very_satisfied,
                                  color: Colors.red
                                ),
                                Text(generateWordPairs().take(1).first.asPascalCase, style: resultPlayerNameStyle),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.sentiment_very_dissatisfied,
                                  color: Colors.blue,
                                ),
                                Text(generateWordPairs().take(1).first.asPascalCase, style: resultPlayerNameStyle),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.sentiment_satisfied,
                                  color: Colors.orange,
                                ),
                                Text(generateWordPairs().take(1).first.asPascalCase, style: resultPlayerNameStyle),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 0, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('WIN', style: resultWinStyle),
                      SizedBox(),
                      Text('LOSE', style: resultLoseStyle),
                    ],
                  )
                ),
              ],
            ),
          );
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
                  Text('ガチホコ ザトウマーケット', style: ruleStageStyle,),
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
                      color: winColor,
                    ),
                    child: Center(
                      child: Text('WIN', style: resultResultStyle),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Text('AplatoonZZZからあげ定食', style: resultDetailTeamNameStyle,),
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
                      color: loseColor,
                    ),
                    child: Center(
                      child: Text('LOSE', style: resultResultStyle),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Text('BplatoonXXXカレーライス', style: resultDetailTeamNameStyle,),
                ],
              ),
            ],
          ),
        );
      }
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