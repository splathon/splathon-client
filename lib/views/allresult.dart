import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:english_words/english_words.dart';
import 'dart:async';
import 'package:openapi/api.dart';

class AllResult extends StatefulWidget {
  AllResult({Key key}) : super(key: key);

  @override
  _AllResultState createState() => _AllResultState();
}

BuildContext sharedContext;

class _AllResultState extends State<AllResult> {
  // ViewModel
  Results _model;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    sharedContext = context;
    return buildAllResult();
  }

  Future fetchData() async {
    var client = new ResultApi();
    var result = client.getResult(9);
    result.then(
      (resultsObj) => setState(() { this._model = resultsObj; } )
    );
  }

  Widget buildAllResult() {
    if (_model == null) {
      // Loading
      return new Center(
        child: const CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
        MatchItem(_model.qualifiers[index]),
      itemCount: _model.qualifiers.length,
    );
  }
}

class MatchItem extends StatelessWidget {
  const MatchItem(this.match);

  final Round match;

  Widget _buildMatch(Round round, BuildContext context) {
    return new Container(
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: borderblueColor,
          width: 1,
        )
      ),
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: ExpansionTile(
        backgroundColor: splaBlueColor,
        key: PageStorageKey<Round>(round),
        title: Text(round.name, style: roundClosedTitleStyle,),
        children: round.rooms.map((room) => _buildTable(round, room, context)).toList(),
        trailing: Image.asset('assets/images/arrowUp.png'),
        onExpansionChanged: (isExpanded) => {          
        },
      ),
    );
  }

  Widget _buildTable(Round round, Room room, BuildContext context) {
    return new Container(
      color: backgroundBlueColor,
      child: ExpansionTile(
        key: PageStorageKey<Room>(room),
        title: Text(room.name, style: roundClosedTitleStyle,),
        children: room.matches.map((match) => _buildResult(round, room, match, context)).toList(),
      ),
    );
  }

  // TODO: Rebase
  Widget _buildResult(Round round, Room room, Match2 match, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    int order = match.order;
    return GestureDetector(
      onTap: () { 
        Navigator.of(context).pushNamed("/result");
      },
      child: new Container(
        foregroundDecoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: borderblueColor,
              width: 1,
            ),
          ),
        ),
        color: Colors.white,
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

  Widget winloseView(String winner) {
    if (winner != 'alpha' && winner != 'bravo') {
      return Container(
        height: 18.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 6),
              padding: const EdgeInsets.only(left: 10.0, right: 10.0,),
              height: 17.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: drawColor,
              ),
              child: Text('DRAW', style: resultResultStyle),
            ),
          ]
        ),
      );
    }

    bool isWinAlpha = winner == 'alpha';

    return Container(
      height: 18.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 6),
            padding: const EdgeInsets.only(left: 10.0, right: 10.0,),
            height: 17.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: isWinAlpha ? winColor : loseColor,
            ),
            child: Text(isWinAlpha ? 'WIN' : 'LOSE', style: resultResultStyle),
          ),
          SizedBox(
            width: 20.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 6),
            padding: const EdgeInsets.only(left: 10.0, right: 10.0,),
            height: 20.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: isWinAlpha ? loseColor : winColor,
            ),
            child: Text(isWinAlpha ? 'LOSE' : 'WIN', style: resultResultStyle),
          )
        ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildMatch(match, context);
  }

  static const TextStyle roundClosedTitleStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: Colors.black,
    fontSize: 26.0,
  );

  static const TextStyle roundExpandedTitleStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: Colors.white,
    fontSize: 26.0,
  );

  static const TextStyle tableTitleStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: Colors.black,
    fontSize: 26.0,
  );

  // Copy
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

