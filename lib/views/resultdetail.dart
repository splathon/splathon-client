import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart' as API;
import 'package:splathon_app/domains/match_provider.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/utils/preference.dart';
import 'package:splathon_app/views/Image.dart';
import 'package:splathon_app/views/report.dart';
import 'package:splathon_app/views/roundedView.dart';

class ResultDetail extends HookConsumerWidget {
  const ResultDetail({super.key, required this.matchId});
  final int matchId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final match = ref.watch(matchProvider(matchId));
    final bool isAdmin = Preference().isAdmin();

    return Scaffold(
      appBar: AppBar(
        title: SplaText('リザルト'),
        backgroundColor: const Color.fromRGBO(11, 49, 143, 1),
      ),
      body: match.when(
        data: (match) {
          return Builder(
            builder: (context) {
              double screenWidth = MediaQuery.of(context).size.width;
              return ListView.builder(
                  itemCount: match.battles.length + 1,
                  itemBuilder: (BuildContext context, i) {
                    if (i == 0) {
                      return Container(
                        color: backgroundLightBlueColor,
                        child: Stack(
                          children: <Widget>[
                            teamMemberView(match, screenWidth),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 0, left: 20, right: 20),
                              child: winLoseTopView(match),
                            ),
                          ],
                        ),
                      );
                    }

                    API.Battle battle = match.battles[i - 1];
                    final bool isNoId = battle.id == null;
                    final bool isNoWinner = battle.winner == null;
                    if (isNoId || isNoWinner) {
                      if (!isAdmin) {
                        return Container();
                      }
                      return Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        foregroundDecoration: const BoxDecoration(
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
                                SizedBox(
                                  width: 50,
                                  child: Stack(
                                    children: <Widget>[
                                      Image.asset(
                                          'assets/images/silverInc.png'),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12),
                                        child: Text('$i戦目', style: roundStyle),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                isNoId
                                    ? const SizedBox()
                                    : Text(
                                        battle.rule?.name ??
                                            '', // TODO: null case
                                        style: ruleStageStyle,
                                      ),
                                const SizedBox(
                                  width: 8,
                                ),
                                isNoId
                                    ? const SizedBox()
                                    : Text(
                                        battle.stage?.name ??
                                            '', // TODO: null case
                                        style: ruleStageStyle,
                                      ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: splaYellowColor,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0))),
                                ),
                                child: const Text(
                                  '結果を報告する',
                                  style: TextStyle(
                                    fontFamily: 'Splatfont',
                                    fontSize: 26,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () async {
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        settings: const RouteSettings(
                                            name: "/report"),
                                        builder: (BuildContext context) =>
                                            Report(match, battle),
                                      ));
                                  ref.refresh(matchProvider(matchId));
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    bool isWinAlpha = battle.winner == 'alpha';
                    return GestureDetector(
                      onTap: () async {
                        if (!isAdmin) {
                          // Normal user can't show upcoming detail result
                          return;
                        }
                        await Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              settings: const RouteSettings(name: "/report"),
                              builder: (BuildContext context) =>
                                  Report(match, battle),
                            ));
                        ref.refresh(matchProvider(matchId));
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        foregroundDecoration: const BoxDecoration(
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
                                SizedBox(
                                  width: 50,
                                  child: Stack(
                                    children: <Widget>[
                                      Image.asset(
                                          'assets/images/silverInc.png'),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12),
                                        child: Text('$i戦目', style: roundStyle),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  battle.rule?.name ?? '', // TODO: null case/
                                  style: ruleStageStyle,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  battle.stage?.name ?? '', // TODO: null case
                                  style: ruleStageStyle,
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 2.0,
                                    right: 2.0,
                                  ),
                                  width: 50,
                                  child: isWinAlpha
                                      ? accentWinView()
                                      : accentLoseView(),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  match.teamAlpha.name,
                                  style: resultDetailTeamNameStyle,
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 2.0,
                                    right: 2.0,
                                  ),
                                  width: 50,
                                  child: isWinAlpha
                                      ? accentLoseView()
                                      : accentWinView(),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  match.teamBravo.name,
                                  style: resultDetailTeamNameStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
          );
        },
        error: (error, stackTrace) => const CircularProgressIndicator(),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget winLoseTopView(API.Match match) {
    if (match.winner == null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const <Widget>[
          Text('UPCOMING', style: resultUpcomingStyle),
        ],
      );
    }
    if (match.winner == API.MatchWinnerEnum.draw) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const <Widget>[
          Text('DRAW', style: resultDrawStyle),
        ],
      );
    }

    bool isWinAlpha = match.winner == API.MatchWinnerEnum.alpha;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        isWinAlpha
            ? const Text('WIN', style: resultWinStyle)
            : const Text('LOSE', style: resultLoseStyle),
        const SizedBox(),
        isWinAlpha
            ? const Text('LOSE', style: resultLoseStyle)
            : const Text('WIN', style: resultWinStyle),
      ],
    );
  }

  Widget teamMemberView(API.Match match, double screenWidth) {
    final bool isNoMember = match.teamAlpha.members.length < 4 ||
        match.teamBravo.members.length < 4;

    List<Widget> alphaMembers = isNoMember
        ? <Widget>[
            SizedBox(
                height: 50,
                child: Center(
                  child: AutoSizeText(
                    match.teamAlpha.name,
                    style: resultTopTeamNameStyle,
                    maxLines: 1,
                  ),
                )),
          ]
        : <Widget>[
            SizedBox(
              height: 50,
              child: Center(
                child: AutoSizeText(
                  match.teamAlpha.name,
                  style: resultTopTeamNameStyle,
                  maxLines: 1,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                CharactorImage(
                    match.teamAlpha.members[0].icon ?? ''), // TODO: null case
                const SizedBox(
                  width: 5,
                ),
                Text(match.teamAlpha.members[0].name,
                    style: resultPlayerNameStyle),
              ],
            ),
            Row(
              children: <Widget>[
                CharactorImage(
                    match.teamAlpha.members[1].icon ?? ''), // TODO: null case
                const SizedBox(
                  width: 5,
                ),
                Text(match.teamAlpha.members[1].name,
                    style: resultPlayerNameStyle),
              ],
            ),
            Row(
              children: <Widget>[
                CharactorImage(
                    match.teamAlpha.members[2].icon ?? ''), // TODO: null case
                const SizedBox(
                  width: 5,
                ),
                Text(match.teamAlpha.members[2].name,
                    style: resultPlayerNameStyle),
              ],
            ),
            Row(
              children: <Widget>[
                CharactorImage(
                    match.teamAlpha.members[3].icon ?? ''), // TODO: null case
                const SizedBox(
                  width: 5,
                ),
                Text(match.teamAlpha.members[3].name,
                    style: resultPlayerNameStyle),
              ],
            ),
          ];
    List<Widget> bravoMembers = isNoMember
        ? <Widget>[
            SizedBox(
              height: 50,
              child: Center(
                child: AutoSizeText(
                  match.teamBravo.name,
                  style: resultTopTeamNameStyle,
                  maxLines: 1,
                ),
              ),
            ),
          ]
        : <Widget>[
            SizedBox(
              height: 50,
              child: Center(
                child: AutoSizeText(
                  match.teamBravo.name,
                  style: resultTopTeamNameStyle,
                  maxLines: 1,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                CharactorImage(
                    match.teamBravo.members[0].icon ?? ''), // TODO: null case
                const SizedBox(
                  width: 5,
                ),
                Text(match.teamBravo.members[0].name,
                    style: resultPlayerNameStyle),
              ],
            ),
            Row(
              children: <Widget>[
                CharactorImage(
                    match.teamBravo.members[1].icon ?? ''), // TODO: null case
                const SizedBox(
                  width: 5,
                ),
                Text(match.teamBravo.members[1].name,
                    style: resultPlayerNameStyle),
              ],
            ),
            Row(
              children: <Widget>[
                CharactorImage(
                    match.teamBravo.members[2].icon ?? ''), // TODO: null case
                const SizedBox(
                  width: 5,
                ),
                Text(match.teamBravo.members[2].name,
                    style: resultPlayerNameStyle),
              ],
            ),
            Row(
              children: <Widget>[
                CharactorImage(
                    match.teamBravo.members[3].icon ?? ''), // TODO: null case
                const SizedBox(
                  width: 5,
                ),
                Text(match.teamBravo.members[3].name,
                    style: resultPlayerNameStyle),
              ],
            ),
          ];

    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
      padding: const EdgeInsets.only(top: 20, bottom: 15),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: screenWidth * 0.35,
            child: Column(
              children: alphaMembers,
            ),
          ),
          Container(
            color: borderColor,
            child: const SizedBox(
              width: 1,
            ),
          ),
          SizedBox(
            width: screenWidth * 0.35,
            child: Column(
              children: bravoMembers,
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

  static const TextStyle resultUpcomingStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: splaYellowColor,
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
