import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/views/roundedView.dart';
import 'package:english_words/english_words.dart';
import 'dart:async';
import 'package:openapi/api.dart' as API;

class Notifications extends StatefulWidget {
  Notifications({Key key}) : super(key: key);

  reload() {
    _notificationsState.reload();
  }

  final _NotificationsState _notificationsState = _NotificationsState();

  @override
  State<StatefulWidget> createState() {
    return _notificationsState;
  }
}

class _NotificationsState extends State<Notifications> with AutomaticKeepAliveClientMixin {
  int notificationCount = 10;
  API.Team myTeam = API.Team();

  @override
  void initState() {
    super.initState();

    // Debug code
    myTeam.id = 73;
    myTeam.name = '道玄坂高校イカ部（仮）';
  }

  reload() {
    
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return buildNotifications();
  }

  Widget buildNotifications() {
    return Container(
      color: backgroundColor,
       child: new ListView.builder(
        itemCount: 10 + 4,
        itemBuilder: (BuildContext context, i) {
          if (i == 0) {
            return Container(
              margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('ようこそ', style: topLabelMiniStyle),
                  SizedBox(width: 5),
                  Text(myTeam.name, style: nextMatchNameStyle),
                  SizedBox(width: 5),
                  Text('チーム', style: topLabelMiniStyle),
                ],
              ),
            );
          }
          if (i == 1) {
            return new Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: new Stack(
                children: <Widget>[
                  Image.asset('assets/images/silverInc.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text('次の試合はここだ！', style: titleStyle),
                  ),
                ],
              ),
            );
          }
          if (i == 2) {
            return new Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: borderColor,
                  width: 1,
                )
              ),
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.only(left: 14.0, right: 14.0),
              height: 62.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 14.0,
                        child: Text('予選 ROUND1 B卓 第4試合', style: nextMatchTitleStyle),
                        ),
                      Container(
                        height: 36.0,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('AplatoonZZZからあげ定食', style: nextMatchNameStyle, maxLines: 1,),
                            Text('戦', style: nextMatchNameStyle),
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
            return new Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: new Stack(
                children: <Widget>[
                  Image.asset('assets/images/goldInc.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text('お知らせ', style: titleStyle),
                  )            
                ],
              ),
            );
          }

          final index = i - 4;
          final isLast = index == notificationCount - 1;
          return new Container(
            decoration: notificationDecoration(index),
            margin: isLast ? const EdgeInsets.only(left: 20, right: 20, bottom: 20) : const EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 14),
                    child: Column(
                      children: <Widget>[
                        Text('9:00', style: nextMatchTitleStyle, maxLines: 1, ),
                        accentNewView(),
                      ],
                    ),
                  ),
                  new SizedBox(
                    width: 12.0,
                  ),
                  new Expanded(            
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text('いよいよ明日3月26日午前9:00から「スプラトゥーン2 特別体験版」の体験期間がスタートする。 4月1日午前8:59までの期間限定で、「スプラトゥーン2」のオンラインプレイが無料で体験できるぞ。ぽよぽよぽよぽよぽよぽよぽよぽよぽよぽよぽよぽよぽよぽよぽよ', style: notificationStyle, ),
                    ),
                  ),
                ],
              )
            )
          );
        }
      ),
    );
  }

  BoxDecoration notificationDecoration(int index) {
    if (index == 0) {
      return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0)
        ),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      );
    }
    if (index == notificationCount - 1) {
      return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0)
        ),
        border: Border.all(
          color: borderColor,
          width: 1,
        )
      );
    }

    return BoxDecoration(
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
        bottom: BorderSide(
          color: borderColor,
          width: 1,
        ),
      )
    );
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