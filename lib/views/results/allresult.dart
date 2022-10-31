import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: library_prefixes
import 'package:openapi/api.dart' as API;
import 'package:splathon_app/domains/result_provider.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text_style.dart';
import 'package:splathon_app/utils/preference.dart';
import 'package:splathon_app/views/components/view.dart';
import 'package:splathon_app/views/results/result_detail.dart';

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
        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: Container(
            color: backgroundColor,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  RoundItem(rounds[index], index == rounds.length - 1),
              itemCount: rounds.length,
            ),
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

class RoundItem extends ConsumerStatefulWidget {
  const RoundItem(this.round, this.isLast, {super.key});
  final API.Round round;
  final bool isLast;

  @override
  RoundItemState createState() => RoundItemState();
}

class RoundItemState extends ConsumerState<RoundItem> {
  RoundItemState();

  Widget _buildRound(API.Round round, BuildContext context) {
    var roomIndexs = List.generate(round.rooms.length, (int index) => index);
    final isExpanded =
        ref.watch(expandResultProvider(ExpandParams(roundName: round.name)));

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: borderblueColor,
          width: 1,
        ),
        color: splaBlueColor,
      ),
      margin: EdgeInsets.only(
          top: 10, left: 20, right: 20, bottom: widget.isLast ? 10 : 0),
      child: ExpansionTile(
        key: PageStorageKey<API.Round>(round),
        title: Text(
          round.name,
          style: largeWhiteTextStyle,
        ),
        trailing: AnimatedRotation(
          turns: isExpanded ? 0.5 : 0,
          duration: const Duration(milliseconds: 200),
          child: Image.asset('assets/images/arrowDownW.png'),
        ),
        initiallyExpanded: isExpanded,
        onExpansionChanged: (isExpanded) {
          ref.read(expandsResultProvider.notifier).changed(
                roundName: round.name,
                isExpanded: isExpanded,
              );
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
    final isExpanded = ref.watch(expandResultProvider(
      ExpandParams(
        roundName: round.name,
        roomName: room.name,
      ),
    ));

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
        initiallyExpanded: isExpanded,
        onExpansionChanged: (isExpanded) {
          ref.read(expandsResultProvider.notifier).changed(
                roundName: round.name,
                roomName: room.name,
                isExpanded: isExpanded,
              );
        },
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
    return _buildRound(widget.round, context);
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
        await Navigator.push(
            context,
            MaterialPageRoute<void>(
              settings: const RouteSettings(name: "/result"),
              builder: (BuildContext context) =>
                  ResultDetail(matchId: match.id),
            ));
        ref.refresh(resultsProvider);
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
                  winloseView(match.winner),
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
}
