import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart' as API;
import 'package:splathon_app/domains/result_provider.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text_style.dart';
import 'package:splathon_app/utils/preference.dart';
import 'package:splathon_app/views/resultdetail.dart';
import 'package:splathon_app/views/roundedView.dart';

class AllResult extends HookConsumerWidget {
  const AllResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(resultsProvider);

    return results.when(
      data: (results) {
        final rounds = results.qualifiers + results.tournament;
        if (rounds.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Text('試合を待て！', style: largeBlackTextStyle),
              Image.asset('assets/images/girl.png'),
            ],
          );
        }
        return Container(
          color: backgroundColor,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                RoundItem(rounds[index]),
            itemCount: rounds.length,
          ),
        );
      },
      error: (error, stackTrace) => const CircularProgressIndicator(),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class RoundItem extends StatefulWidget {
  const RoundItem(this.round, {super.key});
  final API.Round round;

  @override
  _RoundItemState createState() => _RoundItemState(round);
}

class _RoundItemState extends State<RoundItem> {
  _RoundItemState(this.round);

  final API.Round round;
  bool tileExpanded = false;

  Widget _buildRound(API.Round round, BuildContext context) {
    var roomIndexs = List.generate(round.rooms.length, (int index) => index);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: borderblueColor,
          width: 1,
        ),
        color: splaBlueColor,
      ),
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: ExpansionTile(
        key: PageStorageKey<API.Round>(round),
        title: Text(
          round.name,
          style: largeWhiteTextStyle,
        ),
        trailing: AnimatedRotation(
          turns: tileExpanded ? 0.5 : 0,
          duration: const Duration(milliseconds: 200),
          child: Image.asset('assets/images/arrowDownW.png'),
        ),
        onExpansionChanged: (isExpanded) {
          setState(() => tileExpanded = isExpanded);
        },
        children: roomIndexs
            .map((index) => _buildTable(round, round.rooms[index], context,
                index == round.rooms.length - 1))
            .toList(),
      ),
    );
  }

  Widget _buildTable(
      API.Round round, API.Room room, BuildContext context, bool isLast) {
    var matchIndexs = List.generate(room.matches.length, (int index) => index);
    var boxDecoration = isLast
        ? const BoxDecoration(
            color: backgroundBlueColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0)),
          )
        : const BoxDecoration(color: backgroundBlueColor);

    return Container(
      decoration: boxDecoration,
      child: ExpansionTile(
        key: PageStorageKey<API.Room>(room),
        title: Text(
          room.name,
          style: largeBlackTextStyle,
        ),
        children: matchIndexs
            .map((index) => MatchItem(
                  round: round,
                  room: room,
                  match: room.matches[index],
                  isLast: isLast && index == room.matches.length - 1,
                ))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildRound(round, context);
  }
}

class MatchItem extends HookConsumerWidget {
  final API.Round round;
  final API.Room room;
  final API.Match match;
  final bool isLast;
  const MatchItem(
      {super.key,
      required this.round,
      required this.room,
      required this.match,
      required this.isLast});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    int order = match.order ?? 0; // TODO: null case
    var boxDecoration = isLast
        ? const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0)),
          )
        : const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: borderblueColor,
                width: 1,
              ),
            ),
          );

    final bool isAdmin = Preference.isAdmin();

    return GestureDetector(
      onTap: () async {
        if (match.winner == null && !isAdmin) {
          // Normal user can't show upcoming detail result
          return;
        }
        final result = await Navigator.push(
            context,
            MaterialPageRoute<void>(
              settings: const RouteSettings(name: "/result"),
              builder: (BuildContext context) =>
                  ResultDetail(matchId: match.id),
            ));
        // TODO: 個別Refresh対応するならここに実装
      },
      child: Container(
        decoration: boxDecoration,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: screenWidth * 0.35,
                          child: AutoSizeText(
                            match.teamAlpha.name,
                            style: resultNameStyle,
                            maxLines: 1,
                          ),
                        ),
                        const AutoSizeText('vs', style: resultNameStyle),
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
                  winloseView(match),
                  Container(
                    height: 5.0,
                  ),
                ],
              ),
            ),
            (match.winner == null && !isAdmin)
                ? const SizedBox(
                    width: 20,
                  )
                : Image.asset('assets/images/arrowRight.png')
          ],
        ),
      ),
    );
  }

  Widget winloseView(API.Match match) {
    if (match.winner == null) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            unreportedLabelView(),
          ]);
    }

    API.MatchWinnerEnum winner = match.winner!;
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
  }
}
