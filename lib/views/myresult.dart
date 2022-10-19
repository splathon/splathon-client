import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart' as API;
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:splathon_app/utils/event.dart';
import 'package:splathon_app/utils/preference.dart';
import 'package:splathon_app/views/resultdetail.dart';
import 'package:splathon_app/views/roundedView.dart';

class EachResult extends StatefulWidget {
  //const EachResult({Key key}) : super(key: key);

  @override
  _EachResultState createState() => _EachResultState();
}

class _EachResultState extends State<EachResult>
    with AutomaticKeepAliveClientMixin {
  API.Teams? _model;
  API.Results? _results;
  late String dropdownValue;

  @override
  void initState() {
    super.initState();

    fetchTeams();
    listenReloadEvent();
  }

  @override
  bool get wantKeepAlive => true;

  Future fetchTeams() async {
    var client = API.DefaultApi();
    var result = client.listTeams(Config().eventNumber);
    result.then((resultsObj) => setState(() {
          _model = resultsObj;

          // Fetch Result
          int teamId = Preference().getTeamId();
          String teamName = Preference().getTeamName();
          if (teamName.isEmpty) {
            teamId = _model!.teams.first.id;
            teamName = _model!.teams.first.name;
          }
          dropdownValue = teamName;
          fetchResult(teamId);
        }));
  }

  Future fetchResult(int teamId) async {
    var client = API.ResultApi();
    String token = Preference().getToken();
    var result = client.getResult(Config().eventNumber,
        X_SPLATHON_API_TOKEN: token, teamId: teamId);
    result.then((resultsObj) => setState(() {
          _results = resultsObj;
        }));
  }

  listenReloadEvent() async {
    Event().bus.on<MyResultReload>().listen((_) {
      setState(() {
        _model = null;
        _results = null;
        fetchTeams();
      });
    });
  }

  void changedTeam(String teamName) {
    if (_model == null) {
      return;
    }
    for (var team in _model!.teams) {
      team.name == teamName ? fetchResult(team.id) : empty();
    }
  }

  void empty() {}

  @override
  Widget build(BuildContext context) {
    return buildEachResult();
  }

  Widget buildEachResult() {
    if (_results == null) {
      // Loading
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final rounds = _results!.qualifiers + _results!.tournament;
    if (rounds.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const Text(
            '試合を待て！',
            style: noResultTextStyle,
          ),
          Image.asset('assets/images/boys.png'),
        ],
      );
    }

    double screenWidth = MediaQuery.of(context).size.width;

    List<String> teamNames = _model!.teams.map((team) => team.name).toList();

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
                    )),
                margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                height: 72.0,
                width: 300.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, right: 14),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        if (newValue == null) {
                          return;
                        }
                        setState(() {
                          dropdownValue = newValue;
                        });
                        changedTeam(newValue);
                      },
                      items: teamNames
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

            // SPEC: room, matchはRoundごとに各Team1つずつになる前提
            API.Round round = rounds[i - 1];
            API.Room room = round.rooms.first;
            API.Match match = room.matches.first;
            int order = match.order ?? 0; // TODO: null case
            bool isLast = i == rounds.length;

            return GestureDetector(
              onTap: () {
                if (match.winner == null) {
                  return;
                }
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      settings: const RouteSettings(name: "/result"),
                      builder: (BuildContext context) => ResultDetail(match.id),
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: borderblueColor,
                      width: 1,
                    )),
                margin: isLast
                    ? const EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 20)
                    : const EdgeInsets.only(top: 10, left: 20, right: 20),
                padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                height: 90.0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 20.0,
                            child: Text("${round.name} ${room.name} 第$order試合",
                                style: resultTitleStyle),
                          ),
                          SizedBox(
                            height: 36.0,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SizedBox(
                                  width: screenWidth * 0.35,
                                  child: AutoSizeText(
                                    match.teamAlpha.name,
                                    style: resultNameStyle,
                                    maxLines: 1,
                                  ),
                                ),
                                const AutoSizeText('vs',
                                    style: resultNameStyle),
                                SizedBox(
                                  width: screenWidth * 0.35,
                                  child: AutoSizeText(
                                    match.teamBravo.name,
                                    style: resultNameStyle,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          winloseView(match.winner),
                          Container(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    (match.winner == null)
                        ? const SizedBox(
                            width: 20,
                          )
                        : Image.asset('assets/images/arrowRight.png')
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget winloseView(API.MatchWinnerEnum? winner) {
    if (winner == null) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            unreportedLabelView(),
          ]);
    }

    switch (winner) {
      case API.MatchWinnerEnum.alpha:
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              accentWinView(),
              const SizedBox(
                width: 20.0,
              ),
              accentLoseView(),
            ]);

      case API.MatchWinnerEnum.bravo:
        // TODO: Handle this case.
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              accentLoseView(),
              const SizedBox(
                width: 20.0,
              ),
              accentWinView(),
            ]);
      case API.MatchWinnerEnum.draw:
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              accentDarwView(),
            ]);
      default:
        // avoid lint error
        return Container();
    }

    // if (winner == null) {
    //   return Container(
    //     child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: <Widget>[
    //           unreportedLabelView(),
    //         ]),
    //   );
    // }

    // if (winner != 'alpha' && winner != 'bravo') {
    //   return Container(
    //     child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: <Widget>[
    //           accentDarwView(),
    //         ]),
    //   );
    // }

    // bool isWinAlpha = winner == 'alpha';

    // return Container(
    //   child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: <Widget>[
    //         isWinAlpha ? accentWinView() : accentLoseView(),
    //         const SizedBox(
    //           width: 20.0,
    //         ),
    //         isWinAlpha ? accentLoseView() : accentWinView(),
    //       ]),
    // );
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

  static const TextStyle noResultTextStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: blackColor,
    fontSize: 26.0,
  );
}
