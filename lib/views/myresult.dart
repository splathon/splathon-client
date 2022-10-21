import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart' as API;
import 'package:splathon_app/domains/result_provider.dart';
import 'package:splathon_app/domains/teams_provider.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/utils/async_value_list_extension.dart';
import 'package:splathon_app/views/resultdetail.dart';
import 'package:splathon_app/views/roundedView.dart';

class EachResult extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncResults = ref.watch(resultProvider);
    final asyncTeams = ref.watch(teamsProvider);
    final seletedTeam = ref.watch(selectTeamProvider);
    String dropdownValue = seletedTeam.name;

    return [asyncTeams, asyncResults].when(
      loaded: () {
        final results = asyncResults.value!;
        final teams = asyncTeams.value!;
        final rounds = results.qualifiers + results.tournament;

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

        List<String> teamNames = teams.map((team) => team.name).toList();

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
                            dropdownValue = newValue;
                            ref.read(resultProvider.notifier).select(newValue);
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
                          builder: (BuildContext context) =>
                              ResultDetail(matchId: match.id),
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
                                child: Text(
                                    "${round.name} ${room.name} 第$order試合",
                                    style: resultTitleStyle),
                              ),
                              SizedBox(
                                height: 36.0,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
      },
      error: (error, stackTrace) => const Center(
        child: CircularProgressIndicator(),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
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
