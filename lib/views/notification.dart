import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import "package:intl/intl.dart";
import 'package:splathon_app/domains/notice_provider.dart';
import 'package:splathon_app/domains/user_provider.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text_style.dart';
import 'package:splathon_app/views/roundedView.dart';
import 'package:url_launcher/url_launcher.dart';

class Notifications extends HookConsumerWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notification = ref.watch(notificationStateProvider);
    final user = ref.watch(userStateProvider);
    final teamId = user?.teamId;
    final teamName = user?.teamName ?? '';
    final hasTeam = teamId != null;
    final int alreadyReadTime = ref.watch(noticeReadtimeProvider);

    return notification.when(
      data: ((data) {
        // SPEC: Stateを更新すると一瞬で新着マークが外れるため、更新ボタンを押すまで意図的にStateを更新しない
        ref.read(noticeReadtimeProvider.notifier).read(refreshState: false);
        return Container(
          color: backgroundColor,
          child: ListView.builder(
              itemCount: data.notices.length + data.schedules.length + 5,
              itemBuilder: (BuildContext context, i) {
                if (i == 0) {
                  if (!hasTeam) {
                    return Container();
                  }
                  return Container(
                    margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('ようこそ', style: topLabelMiniStyle),
                        const SizedBox(width: 5),
                        Text(teamName, style: nextMatchNameStyle),
                        const SizedBox(width: 5),
                        const Text('チーム', style: topLabelMiniStyle),
                      ],
                    ),
                  );
                }
                if (i == 1) {
                  if (data.nextMatch?.opponentTeam == null) {
                    return Container();
                  }
                  return Container(
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Stack(
                      children: <Widget>[
                        Image.asset('assets/images/goldInc.png'),
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text('次の試合はここだ！', style: titleStyle),
                        ),
                      ],
                    ),
                  );
                }
                if (i == 2) {
                  if (data.nextMatch?.opponentTeam == null) {
                    return Container();
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
                    padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                    height: 70.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 20.0,
                              child: Text(
                                  "${data.nextMatch!.roundName} ${data.nextMatch!.room?.name} 第${data.nextMatch!.matchOrderInRoom}試合",
                                  style: nextMatchTitleStyle),
                            ),
                            SizedBox(
                              height: 36.0,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    data.nextMatch!.opponentTeam?.name ?? '',
                                    style: nextMatchNameStyle,
                                    maxLines: 1,
                                  ),
                                  const Text('戦', style: nextMatchNameStyle),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
                if (i == 3) {
                  return Container(
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Stack(
                      children: <Widget>[
                        Image.asset('assets/images/silverInc.png'),
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text('お知らせ', style: titleStyle),
                        )
                      ],
                    ),
                  );
                }

                if (i - 4 < data.notices.length) {
                  final index = i - 4;
                  final isLast = index == data.notices.length - 1;
                  final notice = data.notices[index];
                  String? url;
                  RegExpMatch? match = RegExp(
                          r"(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)",
                          caseSensitive: false)
                      .firstMatch(notice.text);
                  url = match?.group(0);
                  return Container(
                      decoration:
                          notificationDecoration(index, data.notices.length),
                      margin: isLast
                          ? const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20)
                          : const EdgeInsets.only(left: 20, right: 20),
                      child: Center(
                          child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(left: 14),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 40,
                                  width: 50,
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Text(
                                          dateString(
                                              notice.timestampSec * 1000),
                                          style: nextMatchTitleStyle,
                                          maxLines: 1,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15, left: 8),
                                        child: Text(
                                          timeString(
                                              notice.timestampSec * 1000),
                                          style: nextMatchTitleStyle,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  child: notice.timestampSec * 1000 >
                                          alreadyReadTime
                                      ? accentNewView()
                                      : Container(),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: InkWell(
                                  child: Text(
                                    notice.text,
                                    style: notificationStyle,
                                  ),
                                  onTap: () async {
                                    if (url == null) {
                                      return;
                                    }
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    }
                                  },
                                )),
                          ),
                        ],
                      )));
                }
                if (i - 4 == data.notices.length) {
                  return Container(
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Stack(
                      children: <Widget>[
                        Image.asset('assets/images/goldInc.png'),
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text('スケジュール', style: titleStyle),
                        )
                      ],
                    ),
                  );
                } else {
                  final index = i - 5 - data.notices.length;
                  final isLast = index == data.schedules.length - 1;
                  final schedule = data.schedules[index];
                  final hasDurationTime = schedule.durationSec != null;
                  final endScheduleTimeStamp = schedule.durationSec != null
                      ? (schedule.startTimestampSec ?? 0) +
                          (schedule.durationSec ?? 0) // TODO: null case
                      : null;

                  return Container(
                      decoration:
                          notificationDecoration(index, data.schedules.length),
                      margin: isLast
                          ? const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20)
                          : const EdgeInsets.only(left: 20, right: 20),
                      child: Center(
                          child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(left: 14),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  width: 60,
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Text(
                                          "${timeString((schedule.startTimestampSec ?? 0) * 1000)}　", // TODO: null case
                                          style: nextMatchTitleStyle,
                                          maxLines: 1,
                                        ),
                                      ),
                                      hasDurationTime
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15, left: 8),
                                              child: Text(
                                                endScheduleTimeStamp == null
                                                    ? "-"
                                                    : "～${timeString(endScheduleTimeStamp * 1000)}",
                                                style: nextMatchTitleStyle,
                                                maxLines: 1,
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: InkWell(
                                  child: Text(
                                    schedule.title ?? '', // TODO: null case
                                    style: notificationStyle,
                                  ),
                                )),
                          ),
                        ],
                      )));
                }
              }),
        );
      }),
      error: (error, stackTrace) => const Center(
        child: CircularProgressIndicator(),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  String dateString(int timeMillisecondsSince1970) {
    initializeDateFormatting("ja_JP");
    final dateTime =
        DateTime.fromMillisecondsSinceEpoch(timeMillisecondsSince1970);
    final formatter = DateFormat('MM/dd', "ja_JP");
    final formattedDateString = formatter.format(dateTime);
    return formattedDateString;
  }

  String timeString(int timeMillisecondsSince1970) {
    initializeDateFormatting("ja_JP");
    final dateTime =
        DateTime.fromMillisecondsSinceEpoch(timeMillisecondsSince1970);
    final formatter = DateFormat('HH:mm', "ja_JP");
    //formatter.locale = .current;
    final formattedDateString = formatter.format(dateTime);
    return formattedDateString;
  }

  BoxDecoration notificationDecoration(int index, int length) {
    if (index == 0 && length == 1) {
      return BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      );
    }

    if (index == 0) {
      return BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      );
    }
    if (index == length - 1) {
      return BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
          border: Border.all(
            color: borderColor,
            width: 1,
          ));
    }

    if (index == 1) {
      return const BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(
              color: borderColor,
              width: 1,
            ),
            right: BorderSide(
              color: borderColor,
              width: 1,
            ),
          ));
    }

    return const BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(
            color: borderColor,
            width: 1,
          ),
          right: BorderSide(
            color: borderColor,
            width: 1,
          ),
          top: BorderSide(
            color: borderColor,
            width: 1,
          ),
        ));
  }

  static const topLabelMiniStyle = BlackSplatfontStyle(fontSize: 14.0);
  static const titleStyle = BlackSplatfontStyle(fontSize: 18.0);
  static const notificationStyle = BlackSplatfontStyle(fontSize: 13.0);
  static const nextMatchTitleStyle = GraySplatfontStyle(fontSize: 14.0);
  static const nextMatchNameStyle = BlackSplatfontStyle(fontSize: 20.0);
  static const newStyle = WhiteSplatfontStyle(fontSize: 11.0);
}
