import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import "package:intl/intl.dart";
import 'package:openapi/api.dart' as API;
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:splathon_app/utils/event.dart';
import 'package:splathon_app/utils/preference.dart';
import 'package:splathon_app/views/roundedView.dart';
import 'package:url_launcher/url_launcher.dart';

class Notifications extends StatefulWidget {
  //const Notifications({required Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NotificationsState();
  }
}

class _NotificationsState extends State<Notifications>
    with AutomaticKeepAliveClientMixin {
  API.ListNoticesResponse? _model;
  API.GetNextMatchResponse? _next;
  API.Schedule? _schedule;
  API.Team? myTeam;
  int? alreadyReadTime;

  @override
  void initState() {
    super.initState();

    int teamId = Preference().getTeamId();
    String teamName = Preference().getTeamName();
    myTeam = API.Team(id: teamId, name: teamName);
    print('team $myTeam');
    // myTeam?.id = teamId;
    // myTeam?.name = teamName;

    alreadyReadTime = Preference().getNoticeReadTime();
    //if (myTeam != null) {
    if (teamId > 0 && teamName.isNotEmpty) {
      fetchNextMatch(myTeam!.id);
    } else {
      fetchNotices();
    }

    listenReloadEvent();
  }

  @override
  bool get wantKeepAlive => true;

  listenReloadEvent() async {
    Event().bus.on<NotificationReload>().listen((_) {
      setState(() {
        _model = null;
        _next = null;

        alreadyReadTime = Preference().getNoticeReadTime();
        //if (myTeam != null) {
        if (myTeam!.id > 0 && myTeam!.name.isNotEmpty) {
          fetchNextMatch(myTeam!.id);
        } else {
          fetchNotices();
        }
      });
    });
  }

  Future fetchNotices() async {
    var client = API.DefaultApi();
    String token = Preference().getToken();
    var result = client.listNotices(Config().eventNumber, token);
    result.then((responseObj) => setState(() {
          _model = responseObj;

          updateReadTime();
          fetchSchedule();
        }));
  }

  Future fetchNextMatch(int teamId) async {
    var client = API.MatchApi();
    String token = Preference().getToken();
    var result =
        client.getNextMatch(Config().eventNumber, token, teamId: teamId);
    result.then((responseObj) => setState(() {
          _next = responseObj;

          fetchNotices();
        }));
  }

  Future fetchSchedule() async {
    var client = API.DefaultApi();
    var result = client.getSchedule(Config().eventNumber);
    result.then((responseObj) => setState(() {
          _schedule = responseObj;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return buildNotifications();
  }

  void updateReadTime() {
    final secounds = DateTime.now().millisecondsSinceEpoch;
    Preference().setNoticeReadTime(secounds);
  }

  Widget buildNotifications() {
    if (_schedule == null || _model == null) {
      // Loading
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Container(
      color: backgroundColor,
      child: ListView.builder(
          itemCount: _model!.notices.length + _schedule!.entries.length + 5,
          itemBuilder: (BuildContext context, i) {
            if (i == 0) {
              if (myTeam == null) {
                return Container();
              }
              return Container(
                margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('ようこそ', style: topLabelMiniStyle),
                    const SizedBox(width: 5),
                    Text(myTeam!.name, style: nextMatchNameStyle),
                    const SizedBox(width: 5),
                    const Text('チーム', style: topLabelMiniStyle),
                  ],
                ),
              );
            }
            if (i == 1) {
              if (_next?.nextMatch?.opponentTeam == null) {
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
              if (_next?.nextMatch?.opponentTeam == null) {
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
                              "${_next!.nextMatch!.roundName} ${_next!.nextMatch!.room?.name} 第${_next!.nextMatch!.matchOrderInRoom}試合",
                              style: nextMatchTitleStyle),
                        ),
                        SizedBox(
                          height: 36.0,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                _next!.nextMatch!.opponentTeam?.name ?? '',
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

            if (i - 4 < _model!.notices.length) {
              final index = i - 4;
              final isLast = index == _model!.notices.length - 1;
              final notice = _model!.notices[index];
              String? url;
              RegExpMatch? match = RegExp(
                      r"(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)",
                      caseSensitive: false)
                  .firstMatch(notice.text);
              url = match?.group(0);
              return Container(
                  decoration:
                      notificationDecoration(index, _model!.notices.length),
                  margin: isLast
                      ? const EdgeInsets.only(left: 20, right: 20, bottom: 20)
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
                                      dateString(notice.timestampSec * 1000),
                                      style: nextMatchTitleStyle,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 15, left: 8),
                                    child: Text(
                                      timeString(notice.timestampSec * 1000),
                                      style: nextMatchTitleStyle,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: isAlreadyRead(notice.timestampSec * 1000)
                                  ? Container()
                                  : accentNewView(),
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
            if (i - 4 == _model!.notices.length) {
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
              final index = i - 5 - _model!.notices.length;
              final isLast = index == _schedule!.entries.length - 1;
              final schedule = _schedule!.entries[index];
              final hasDurationTime = schedule.durationSec != null;
              final endScheduleTimeStamp = schedule.durationSec != null
                  ? (schedule.startTimestampSec ?? 0) +
                      (schedule.durationSec ?? 0) // TODO: null case
                  : null;

              return Container(
                  decoration:
                      notificationDecoration(index, _schedule!.entries.length),
                  margin: isLast
                      ? const EdgeInsets.only(left: 20, right: 20, bottom: 20)
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

  bool isAlreadyRead(int timeMillisecondsSince1970) {
    if (alreadyReadTime == null) {
      return false;
    }

    return alreadyReadTime! > timeMillisecondsSince1970;
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

  static const TextStyle topLabelMiniStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: blackColor,
    fontSize: 14.0,
  );

  static const TextStyle titleStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: blackColor,
    fontSize: 18.0,
  );

  static const TextStyle notificationStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: blackColor,
    fontSize: 13.0,
  );

  static const TextStyle nextMatchTitleStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: grayColor,
    fontSize: 14.0,
  );

  static const TextStyle nextMatchNameStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: blackColor,
    fontSize: 20.0,
  );

  static const TextStyle newStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: Colors.white,
    fontSize: 11.0,
  );
}
