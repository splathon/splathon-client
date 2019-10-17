import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/views/result.dart';
import 'package:splathon_app/views/notification.dart';
import 'package:splathon_app/views/reception.dart';
import 'package:splathon_app/views/rankings.dart';
import 'package:splathon_app/views/customTabs.dart' as CustomView;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:splathon_app/utils/event.dart';
import 'dart:io';

/**
 * Reference
 * https://github.com/nisrulz/flutter-examples/blob/master/using_bottom_nav_bar/lib/main.dart
 */
class HomeTabbedBar extends StatefulWidget {
  @override
  HomeTabbedBarState createState() => new HomeTabbedBarState();
}

// SingleTickerProviderStateMixin is used for animation
class HomeTabbedBarState extends State<HomeTabbedBar> with SingleTickerProviderStateMixin {
  TabController controller;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();

    controller = new TabController(length: 4, vsync: this);
    setupFirebaseCloudMessaging(context);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  reload() {
    switch (controller.index) {
      case 0:
        Event().bus.fire(NotificationReload());
        return;
      case 1:
        Event().bus.fire(ResultReload());
        return;
      case 2:
        Event().bus.fire(RankingReload());
        return;
      case 3:
        Event().bus.fire(ReceptionReload());
        return;      
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: SplaText('Splathon #11'),
        backgroundColor: Color.fromRGBO(11, 49, 143, 1),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/images/reloadIcon.png'),
            onPressed: reload,
          ),
        ],
      ),
      body: new TabBarView(
        physics: NeverScrollableScrollPhysics(),
        // TODO: Set each Views
        children: <Widget>[
            new Notifications(),
            new ResultTabbedBar(),
            new Rankings(),
            new ReceptionTabbedBar(),
          ],
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        color: splaBlueColor,
        child: SafeArea(child: 
          new TabBar(
            isScrollable: false,
            tabs: <CustomView.Tab>[
              new CustomView.Tab(
                child: Text('お知らせ', style: tabTextStyle,),
                icon: Image.asset('assets/images/icon_notification.png'),
              ),
              new CustomView.Tab(
                child: Text('リザルト', style: tabTextStyle,),
                icon: Image.asset('assets/images/icon_result.png'),
              ),
              new CustomView.Tab(
                child: Text('ランキング', style: tabTextStyle,),
                icon: Image.asset('assets/images/icon_ranking.png'),
              ),
              new CustomView.Tab(
                child: Text('受付コード', style: tabTextStyle,),
                icon: Image.asset('assets/images/icon_reception.png'),
              ),
            ],
            controller: controller,
          ),
        ),
      ),
    );
  }
  
  // TODO: 隠蔽化したい
  void setupFirebaseCloudMessaging(BuildContext context) {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
        buildDialog(context, message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true)
    );
    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print('Settings registered: $settings');
    });
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      print('Push Teken: $token');
    });
  }

  buildDialog(BuildContext context, Map<String, dynamic> message) {
    String text;
    if (Platform.isIOS) { // iOS APNs
      text = '${message['aps']['alert']['body']}';
    } else if (Platform.isAndroid) { // Android FCM
      text = '${message['notification']['body']}';
    } else { // Other platform
      return;
    }
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext build) {
        return new AlertDialog(
          titlePadding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          title: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: splaBlueColor,
            ),
            padding: const EdgeInsets.all(10),
            child: Center(child: Text('お知らせ', style: popupTitleStyle,),),
          ),
          content: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 100),
            child: Text('$text', style: popupMessageStyle,),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('CLOSE'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ],
        );
      },
    );
  }

  static const TextStyle popupTitleStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: Colors.white,
    fontSize: 20.0,
  );

  static const TextStyle popupMessageStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: blackColor,
    fontSize: 16.0,
  );

  static const TextStyle tabTextStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: Colors.white,
    fontSize: 15.0,
  );
}