import 'dart:async';

import 'package:flutter/material.dart';
import 'package:openapi/api.dart' as API;
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/text_style.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:splathon_app/utils/preference.dart';

class Report extends StatefulWidget {
  final API.Match _match;
  final API.Battle _battle;
  const Report(this._match, this._battle);

  @override
  _ReportState createState() => _ReportState(_match, _battle);
}

late BuildContext sharedContext;

class _ReportState extends State<Report> {
  late final API.Match _match;
  late final API.Battle _battle;
  _ReportState(this._match, this._battle);
  late String dropdownStageValue;
  late String dropdownRuleValue;
  late String dropdownTeamValue;

  // ViewModel
  late API.Event _model;

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
    var client = API.DefaultApi();
    var result = client.getEvent(Config.eventNumber);
    result.then((resultsObj) => setState(() {
          if (resultsObj == null) {
            return; // TODO: null case
          }
          _model = resultsObj;
        }));
  }

  void changedRule(String ruleName) {
    for (var rule in _model.rules) {
      rule.name == ruleName ? _battle.rule = rule : {};
    }
  }

  void changedStage(String stageName) {
    for (var stage in _model.stages) {
      stage.name == stageName ? _battle.stage = stage : {};
    }
  }

  void changedTeam(String winner) {
    if (winner == API.BattleWinnerEnum.alpha.value) {
      _battle.winner = API.BattleWinnerEnum.alpha;
    } else {
      _battle.winner = API.BattleWinnerEnum.bravo;
    }
    //_battle.winner = winner;
  }

  Widget buildAllResult() {
    if (_model == null) {
      // Loading
      return Scaffold(
        appBar: AppBar(
          title: const SplaText('リザルト'),
          backgroundColor: const Color.fromRGBO(11, 49, 143, 1),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    _battle.rule ??= _model.rules.first;
    dropdownRuleValue = _battle.rule!.name ?? ''; // TODO: null case
    _battle.stage ??= _model.stages.first;
    dropdownStageValue = _battle.stage?.name ?? ''; // TODO: null case
    dropdownRuleValue = _battle.rule?.name ?? ''; // TODO: null case
    dropdownStageValue = _battle.stage?.name ?? ''; // TODO: null case
    dropdownTeamValue = _battle.winner?.value ?? ''; // TODO: null case

    double screenWidth = MediaQuery.of(context).size.width;
    final order = _battle.order;

    return Scaffold(
      appBar: AppBar(
        title: const SplaText('リザルト'),
        backgroundColor: const Color.fromRGBO(11, 49, 143, 1),
      ),
      body: ListView.builder(
        itemCount: 9,
        itemBuilder: (BuildContext context, i) {
          if (i == 0) {
            return Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Stack(
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
            return SizedBox(
              height: 36.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: screenWidth * 0.35,
                    child: Text(
                      _match.teamAlpha.name,
                      style: resultNameStyle,
                      maxLines: 1,
                    ),
                  ),
                  const Text('vs', style: resultNameStyle),
                  SizedBox(
                    width: screenWidth * 0.35,
                    child: Text(
                      _match.teamBravo.name,
                      style: resultNameStyle,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            );
          }
          if (i == 2) {
            return Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Stack(
                children: <Widget>[
                  Image.asset('assets/images/silverInc.png'),
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
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
                  )),
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              height: 72.0,
              width: 300.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 14),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: dropdownRuleValue,
                    onChanged: (String? newValue) {
                      if (newValue == null) {
                        return;
                      }
                      setState(() {
                        dropdownRuleValue = newValue;
                      });
                      changedRule(newValue);
                    },
                    items: _model.rules
                        .map<DropdownMenuItem<String>>((API.Rule rule) {
                      return DropdownMenuItem<String>(
                        value: rule.name,
                        child: Text(rule.name ?? '',
                            style: topNameStyle), // TODO: null case
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          }
          if (i == 4) {
            return Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Stack(
                children: <Widget>[
                  Image.asset('assets/images/silverInc.png'),
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
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
                  )),
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              height: 72.0,
              width: 300.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 14),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: dropdownStageValue,
                    onChanged: (String? newValue) {
                      if (newValue == null) {
                        return;
                      }
                      setState(() {
                        dropdownStageValue = newValue;
                      });
                      changedStage(newValue);
                    },
                    items: _model.stages
                        .map<DropdownMenuItem<String>>((API.Stage stage) {
                      return DropdownMenuItem<String>(
                        value: stage.name,
                        child: Text(stage.name ?? '',
                            style: topNameStyle), // TODO: null case
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          }
          if (i == 6) {
            return Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Stack(
                children: <Widget>[
                  Image.asset('assets/images/goldInc.png'),
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
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
                  )),
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              height: 72.0,
              width: 300.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 14),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: dropdownTeamValue,
                    onChanged: (String? newValue) {
                      if (newValue == null) {
                        return;
                      }
                      setState(() {
                        dropdownTeamValue = newValue;
                      });
                      changedTeam(newValue);
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: 'alpha', //_match.teamAlpha.name,
                        child: Text(_match.teamAlpha.name, style: topNameStyle),
                      ),
                      DropdownMenuItem<String>(
                        value: 'bravo', //_match.teamBravo.name,
                        child: Text(_match.teamBravo.name, style: topNameStyle),
                      ),
                      const DropdownMenuItem<String>(
                        value: null, //_match.teamBravo.name,
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
              margin: const EdgeInsets.only(
                  top: 40, left: 20, right: 20, bottom: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: splaYellowColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                ),
                child: const Text(
                  '試合結果を送信する',
                  style: actionButtonStyle,
                ),
                onPressed: () {
                  submit();
                },
              ),
            );
          }

          // out of range
          return Container();
        },
      ),
    );
  }

  submit() {
    var client = API.AdminApi();
    String token = Preference.getToken();
    print(_battle);
    var result =
        client.updateBattle(Config.eventNumber, _match.id, token, _battle);
    result
        .then((body) => setState(() {
              pop();
            }))
        .catchError((onError) {
      buildDialog(context, 'エラー', '登録に失敗しました');
    });
  }

  buildDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext build) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          title: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: splaBlueColor,
            ),
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                title,
                style: popupTitleStyle,
              ),
            ),
          ),
          content: Text(
            message,
            style: popupMessageStyle,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CLOSE'),
              onPressed: () {
                pop();
              },
            ),
          ],
        );
      },
    );
  }

  pop() {
    Navigator.of(context).pop();
  }
}
