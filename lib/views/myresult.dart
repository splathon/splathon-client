import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:english_words/english_words.dart';

class EachResult extends StatefulWidget {
  EachResult({Key key}) : super(key: key);

  @override
  _EachResultState createState() => _EachResultState();
}

class _EachResultState extends State<EachResult> {
  @override
  Widget build(BuildContext context) {
    return buildEachResult();
  }

  Widget buildEachResult() {
    String dropdownValue = 'AplatoonZZZからあげ定食';
    double screenWidth = MediaQuery.of(context).size.width;

    return new ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, i) {
        if (i == 0) {
          return Container(
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: borderblueColor,
                width: 1,
              )
            ),
            color: Colors.white,
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
                  },
                  items: <String>['AplatoonZZZからあげ定食', 'BplatoonXXXカレーライス', 'CplatoonYYYハンバーグ', 'DplatoonWWWステーキ']
                      .map<DropdownMenuItem<String>>((String value) {
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
        return new Container(
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: borderblueColor,
              width: 1,
            )
          ),
          color: Colors.white,
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
        );
      }
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
