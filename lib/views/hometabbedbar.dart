import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/views/result.dart';
import 'package:splathon_app/views/notification.dart';
import 'package:splathon_app/views/reception.dart';
import 'package:splathon_app/views/rankings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

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
  Notifications notifications = new Notifications();
  ResultTabbedBar resultTabbedBar = new ResultTabbedBar();
  Rankings rankings = new Rankings();
  ReceptionTabbedBar receptionTabbedBar = new ReceptionTabbedBar();
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

  void reload() {
    switch (controller.index) {
      case 0:
        notifications.reload();
        break;
      case 1:
        //resultTabbedBar.reload();
        break;
      case 2:
        rankings.reload();
        break;
      case 3:
        receptionTabbedBar.reload();
        break;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: SplaText('Splathon #10'),
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
            notifications,
            rankings,
            Text('a'),
            receptionTabbedBar,
          ],
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        color: splaBlueColor,
        child: SafeArea(child: 
          new TabBar(
            isScrollable: false,
            tabs: <Tab>[
              new Tab(
                text: "お知らせ",
                icon: Image.asset('assets/images/icon_notification.png'),
              ),
              new Tab(
                text: 'リザルト',
                icon: Image.asset('assets/images/icon_result.png'),
              ),
              new Tab(
                text: 'ランキング',
                icon: Image.asset('assets/images/icon_ranking.png'),
              ),
              new Tab(
                text: '受付コード',
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
    String text = '${message['aps']['alert']['body']}'; // iOS APNs
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
}