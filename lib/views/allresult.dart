import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:english_words/english_words.dart';

class AllResult extends StatefulWidget {
  AllResult({Key key}) : super(key: key);

  @override
  _AllResultState createState() => _AllResultState();
}

class _AllResultState extends State<AllResult> {
  @override
  Widget build(BuildContext context) {
    sharedContext = context;
    return buildAllResult();
  }

  Widget buildAllResult() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
        MatchItem(data[index]),
      itemCount: data.length,
    );
  }
}

BuildContext sharedContext;

class MatchRound {
  MatchRound(this.title, [this.children = const <MatchTable>[]]);

  final String title;
  final List<MatchTable> children;
}

class MatchTable {
  MatchTable(this.title, [this.children = const <MatchResult>[]]);

  final String title;
  final List<MatchResult> children;
}

class MatchResult {
  MatchResult(this.title);
  final String title;
}

// TODO: Remove mock data
final List<MatchRound> data = <MatchRound>[
  MatchRound(
    '予選 ROUND1',
    <MatchTable>[
      MatchTable('A卓',
        <MatchResult>[
          MatchResult('Item'),
          MatchResult('Item'),
          MatchResult('Item'),
        ],
      ),
      MatchTable('B卓',
        <MatchResult>[
          MatchResult('Item'),
          MatchResult('Item'),
        ],
      ),
      MatchTable('C卓',
        <MatchResult>[
          MatchResult('Item'),
          MatchResult('Item'),
        ],
      ),
    ],
  ),
  MatchRound(
    '予選 ROUND2',
    <MatchTable>[
      MatchTable('A卓',
        <MatchResult>[
          MatchResult('Item'),
          MatchResult('Item'),
        ],
      ),
      MatchTable('B卓',
        <MatchResult>[
          MatchResult('Item'),
          MatchResult('Item'),
        ],
      ),
    ],
  ),
  MatchRound(
    '予選 ROUND3',
    <MatchTable>[
      MatchTable('A卓',
        <MatchResult>[
          MatchResult('Item'),
          MatchResult('Item'),
        ],
      ),
      MatchTable('B卓',
        <MatchResult>[
          MatchResult('Item'),
          MatchResult('Item'),
          MatchResult('Item'),
        ],
      ),
      MatchTable('C卓',
        <MatchResult>[
          MatchResult('Item'),
          MatchResult('Item'),
          MatchResult('Item'),
          MatchResult('Item'),
        ],
      ),
    ],
  ),
];

class MatchItem extends StatelessWidget {
  const MatchItem(this.match);

  final MatchRound match;

  Widget _buildMatch(MatchRound root, BuildContext context) {
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
        key: PageStorageKey<MatchRound>(root),
        title: Text(root.title, style: roundClosedTitleStyle,),
        children: root.children.map((root) => _buildTable(root, context)).toList(),
        trailing: Image.asset('assets/images/arrowUp.png'),
        onExpansionChanged: (isExpanded) => {          
        },
      ),
    );
  }

  Widget _buildTable(MatchTable root, BuildContext context) {
    return new Container(
      color: backgroundBlueColor,
      child: ExpansionTile(
        key: PageStorageKey<MatchTable>(root),
        title: Text(root.title, style: roundClosedTitleStyle,),
        children: root.children.map((root) => _buildResult(root, context)).toList(),
      ),
    );
  }

  // TODO: Rebase
  Widget _buildResult(MatchResult root, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return GestureDetector(
      onTap: () { 
        Navigator.of(context).pushNamed("/result");
      },
      child: new Container(//
    // )

    // return new Container(
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
                  child: Text('予選 ROUND1 B卓 第4試合', style: resultTitleStyle),
                  ),
                Container(
                  height: 36.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: screenWidth * 0.35,
                        child: Text('AplatoonZZZからあげ定食', style: resultNameStyle, maxLines: 1,),
                      ),
                      Text('vs', style: resultNameStyle),
                      SizedBox(
                        width: screenWidth * 0.35,
                        child: Text('BplatoonXXXカレーライス', style: resultNameStyle, maxLines: 1,),
                      ),                    
                    ],
                  ),
                ),
                Container(
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
                          color: winColor,
                        ),
                        child: Text('WIN', style: resultResultStyle),
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
                          color: loseColor,
                        ),
                        child: Text('LOSE', style: resultResultStyle),
                      )
                    ]
                  ),
                ),
              ],
            ),
          ),
          Image.asset('assets/images/arrowRight.png')
        ],
      ),
    ));
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

