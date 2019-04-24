import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/utils/preference.dart';
import 'package:splathon_app/utils/config.dart';
import 'dart:async';
import 'package:openapi/api.dart' as API;

class Report extends StatefulWidget {
  final API.Match _match;
  final API.Battle _battle;
  Report(this._match, this._battle);

  @override
  _ReportState createState() => _ReportState(_match, _battle);
}

BuildContext sharedContext;

class _ReportState extends State<Report> {
  final API.Match _match;
  final API.Battle _battle;
  _ReportState(this._match, this._battle);
  String dropdownStageValue;
  String dropdownRuleValue;
  String dropdownTeamValue;

  // ViewModel
  API.Event _model;

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
    var client = new API.DefaultApi();
    var result = client.getEvent(Config().eventNumber);
    result.then(
      (resultsObj) => setState(() { this._model = resultsObj; } )
    );
  }

  void changedRule(String ruleName) {
    _model.rules.forEach((rule) => 
      rule.name == ruleName ? _battle.rule = rule : {},
    );
  }

  void changedStage(String stageName) {
    _model.stages.forEach((stage) => 
      stage.name == stageName ? _battle.stage = stage : {},
    );
  }
  void changedTeam(String winner) {
    _battle.winner = winner;
  }

  Widget buildAllResult() {
    if (_model == null) {
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

    if (_battle.rule == null) {
      _battle.rule = _model.rules.first;
    }
    dropdownRuleValue = _battle.rule.name;
    if (_battle.stage == null) {
      _battle.stage = _model.stages.first;
    }
    dropdownStageValue = _battle.stage.name;
    dropdownRuleValue = _battle.rule.name;
    dropdownStageValue = _battle.stage.name;
    dropdownTeamValue = _battle.winner;

    double screenWidth = MediaQuery.of(context).size.width;
    final order = _battle.order;

    return Scaffold(
      appBar: new AppBar(
        title: SplaText('リザルト'),
        backgroundColor: Color.fromRGBO(11, 49, 143, 1),
      ),
      body: ListView.builder(
        itemCount: 9,
        itemBuilder: (BuildContext context, i) {
          if (i == 0) {
            return new Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: new Stack(
                children: <Widget>[
                  Image.asset('assets/images/goldInc.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text('マッチ 第$order試合', style: headerStyle),
                  ),
                ],
              ),
            );
          }
          if (i == 1) {
            return Container(
              height: 36.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: screenWidth * 0.35,
                    child: Text(_match.teamAlpha.name, style: resultNameStyle, maxLines: 1,),
                  ),
                  Text('vs', style: resultNameStyle),
                  SizedBox(
                    width: screenWidth * 0.35,
                    child: Text(_match.teamBravo.name, style: resultNameStyle, maxLines: 1,),
                  ),                    
                ],
              ),
            );
          }
          if (i == 2) {
            return new Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: new Stack(
                children: <Widget>[
                  Image.asset('assets/images/silverInc.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text('ルール', style: headerStyle),
                  ),
                ],
              ),
            );
          }
          if (i == 3) {
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
                    value: dropdownRuleValue,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownRuleValue = newValue;
                      });
                      changedRule(newValue);
                    },
                    items: _model.rules.map<DropdownMenuItem<String>>((API.Rule rule) {
                      return DropdownMenuItem<String>(
                        value: rule.name,
                        child: Text(rule.name, style: topNameStyle),
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          }
          if (i == 4) {
            return new Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: new Stack(
                children: <Widget>[
                  Image.asset('assets/images/silverInc.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text('ステージ', style: headerStyle),
                  ),
                ],
              ),
            );
          }
          if (i == 5) {
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
                    value: dropdownStageValue,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownStageValue = newValue;
                      });
                      changedStage(newValue);
                    },
                    items: _model.stages.map<DropdownMenuItem<String>>((API.Stage stage) {
                      return DropdownMenuItem<String>(
                        value: stage.name,
                        child: Text(stage.name, style: topNameStyle),
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          }
          if (i == 6) {
            return new Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: new Stack(
                children: <Widget>[
                  Image.asset('assets/images/goldInc.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text('勝者', style: headerStyle),
                  ),
                ],
              ),
            );
          }
          if (i == 7) {
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
                    value: dropdownTeamValue,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownTeamValue = newValue;
                      });
                      changedTeam(newValue);
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: 'alpha',//_match.teamAlpha.name,
                        child: Text(_match.teamAlpha.name, style: topNameStyle),
                      ),
                      DropdownMenuItem<String>(
                        value: 'bravo',//_match.teamBravo.name,
                        child: Text(_match.teamBravo.name, style: topNameStyle),
                      ),
                      DropdownMenuItem<String>(
                        value: null,//_match.teamBravo.name,
                        child: Text('指定しない', style: topNameStyle),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          if (i == 8) {
            return Container(
              margin: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 30),
              child: RaisedButton(
                color: splaYellowColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))
                ),
                child: Text('試合結果を送信する',
                  style: TextStyle(
                    fontFamily: 'Splatfont',
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  submit();
                },
              ),
            );
          }
        },
      ),
    );
  }

  submit() {
    var client = new API.AdminApi();
    String token = Preference().getToken();
    print(_battle);
    var result = client.updateBattle(Config().eventNumber, _match.id, token, _battle);
    result.then(
      (body) => setState(() { 
        pop();
      })
    )
    .catchError((onError) => setState(() {
      pop();
    })
    );
  }

  pop() {
    Navigator.of(context).pop();
  }

  static const TextStyle headerStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: blackColor,
    fontSize: 18.0,
  );

  static const TextStyle topNameStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: blackColor,
    fontSize: 22.0,
  );

  static const TextStyle resultNameStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: blackColor,
    fontSize: 20.0,
  );
}