import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/views/result.dart';
import 'package:splathon_app/views/notification.dart';

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

  @override
  void initState() {
    super.initState();

    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: SplaText('Splathon #10'),
        backgroundColor: Color.fromRGBO(11, 49, 143, 1),
      ),
      body: new TabBarView(
        physics: NeverScrollableScrollPhysics(),
        // TODO: Set each Views
        children: <Widget>[
            new Notifications(),
            new ResultTabbedBar(),
            Center(
              child: Text("Ranking"),
            ),
            Center(
              child: Text("Reception"),
            ),
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
}