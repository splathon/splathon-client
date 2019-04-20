import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/views/roundedView.dart';
import 'package:english_words/english_words.dart';
import 'package:splathon_app/views/resultdetail.dart';
import 'dart:async';
import 'package:openapi/api.dart' as API;

class AllResult extends StatefulWidget {
  AllResult({Key key}) : super(key: key);

  @override
  _AllResultState createState() => _AllResultState();
}

BuildContext sharedContext;

class _AllResultState extends State<AllResult> {
  // ViewModel
  API.Results _model;

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
    var client = new API.ResultApi();
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

    return Container(
      color: backgroundColor,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
          MatchItem(_model.qualifiers[index]),
        itemCount: _model.qualifiers.length,
      ),
    );
  }
}

class MatchItem extends StatelessWidget {
  const MatchItem(this.match);

  final API.Round match;

  Widget _buildMatch(API.Round round, BuildContext context) {
    var roomIndexs = List.generate(round.rooms.length, (int index) => index);

    return new Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: borderblueColor,
          width: 1,
        )
      ),
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: ExpansionTile(
        //backgroundColor: splaBlueColor,
        key: PageStorageKey<API.Round>(round),
        title: Text(round.name, style: roundClosedTitleStyle,),
        children: roomIndexs.map((index) => _buildTable(round, round.rooms[index], context, index == round.rooms.length - 1)).toList(),
        trailing: Image.asset('assets/images/arrowUp.png'),
        onExpansionChanged: (isExpanded) => {      
        },
      ),
    );
  }

  Widget _buildTable(API.Round round, API.Room room, BuildContext context, bool isLast) {
    var matchIndexs = List.generate(room.matches.length, (int index) => index);
    var boxDecoration = isLast ? 
      BoxDecoration(
        color: backgroundBlueColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0)
        ),
      ) :
      BoxDecoration(
        color: backgroundBlueColor
      );

    return new Container(
      decoration: boxDecoration,
      child: ExpansionTile(
        key: PageStorageKey<API.Room>(room),
        title: Text(room.name, style: roundClosedTitleStyle,),
        children: matchIndexs.map((index) => _buildResult(round, room, room.matches[index], context, index == room.matches.length - 1)).toList(),
      ),
    );
  }

  // TODO: Rebase
  Widget _buildResult(API.Round round, API.Room room, API.Match match, BuildContext context, bool isLast) {
    double screenWidth = MediaQuery.of(context).size.width;
    int order = match.order;
    var boxDecoration = isLast ?
      BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0)
        ),
      ) :
      BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: borderblueColor,
            width: 1,
          ),
        ),
      );
    
    return GestureDetector(
      onTap: () { 
        Navigator.push(context, new MaterialPageRoute<Null>(
          settings: const RouteSettings(name: "/result"),
          builder: (BuildContext context) => new ResultDetail(match),
        ));
      },
      child: new Container(
        decoration: boxDecoration,
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

