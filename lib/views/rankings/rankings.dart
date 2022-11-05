import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: library_prefixes
import 'package:openapi/api.dart' as API;
import 'package:splathon_app/domains/ranking_provider.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text_style.dart';
import 'package:splathon_app/views/components/error_view.dart';
import 'package:splathon_app/views/components/image.dart';
import 'package:splathon_app/views/components/rounded_view.dart';

class Rankings extends HookConsumerWidget {
  const Rankings({super.key});

  @override
  Widget build(Object context, WidgetRef ref) {
    final ranking = ref.watch(rankingProvider);

    return ranking.when(
      data: (ranking) {
        final rankings = ranking.rankings;
        return Builder(builder: (context) {
          double screenWidth = MediaQuery.of(context).size.width;
          return Container(
            color: backgroundColor,
            child: ListView.builder(
              itemCount: rankings.length * 2 + 1,
              itemBuilder: (BuildContext context, i) {
                if (i == 0) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 2, right: 20),
                        child: Text(ranking.rankTime ?? '',
                            style: timeStyle), // TODO: null case
                      ),
                    ],
                  );
                }

                final index = (i - 1) ~/ 2;
                API.Rank rank = rankings[index];
                if (i.isOdd) {
                  return headerView(index, rank);
                }

                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: borderColor,
                        width: 1,
                      )),
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  height: 75.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 36.0,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            memberView(
                                getMember(rank.team.members, 0), screenWidth),
                            memberView(
                                getMember(rank.team.members, 1), screenWidth),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 36.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            memberView(
                                getMember(rank.team.members, 2), screenWidth),
                            memberView(
                                getMember(rank.team.members, 3), screenWidth),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
      },
      error: (error, stackTrace) => ErrorView(
        error: error,
        retryPressed: () => ref.refresh(rankingProvider),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  API.Member? getMember(List<API.Member> members, int index) {
    if (members.length > index) {
      return members[index];
    }
    return null;
  }

  Widget headerView(int index, API.Rank rank) {
    final rankIndex = index + 1; // rankIndex: 1..N
    final isTop3 = rankIndex <= 3;
    return Container(
      margin: index == 0
          ? const EdgeInsets.only(left: 20, right: 20)
          : const EdgeInsets.only(top: 12, left: 20, right: 20),
      height: 36.0,
      child: Row(
        children: <Widget>[
          isTop3
              ? Image.asset('assets/images/crown$rankIndex.png')
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0),
            child: Text(
              '$rankIndex位',
              style: rankTextStyle(rankIndex),
            ),
          ),
          Text(rank.team.name, style: rankTextStyle(rankIndex)),
          Expanded(
            child: Container(),
          ),
          Container(
            margin: const EdgeInsets.only(left: 6.0, bottom: 1),
            child: RoundedView.pointLabelView(rank.point),
          ),
        ],
      ),
    );
  }

  Widget memberView(API.Member? member, double screenWidth) {
    if (member == null) {
      return Expanded(flex: 1, child: Container());
    }

    final textWidth = (screenWidth / 2) - 65;

    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Row(
          children: <Widget>[
            charactorImage(member.icon ?? ''), // TODO: null case
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: textWidth,
              child: AutoSizeText(
                member.name,
                style: nameStyle,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static const pointStyle = BlueSplatfontStyle(fontSize: 13.0);
  static const nameStyle = BlackSplatfontStyle(fontSize: 14.0);
  static const timeStyle = GraySplatfontStyle(fontSize: 14.0);

  TextStyle rankTextStyle(int index) {
    return TextStyle(
      fontFamily: 'Splatfont',
      color: rankTextColor(index),
      fontSize: 18.0,
    );
  }

  Color rankTextColor(int index) {
    switch (index) {
      case 1:
        return const Color.fromRGBO(187, 150, 0, 1.0);
      case 2:
        return const Color.fromRGBO(120, 130, 154, 1.0);
      case 3:
        return const Color.fromRGBO(188, 130, 89, 1.0);
      default:
        return blackColor;
    }
  }
}
