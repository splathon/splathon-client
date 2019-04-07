import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/views/result.dart';

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
            Center(
              child: Text("Notifications"),
            ),
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
                icon: new Icon(Icons.sms),
              ),
              new Tab(
                icon: new Icon(Icons.whatshot),
              ),
              new Tab(
                icon: new Icon(Icons.format_list_numbered),
              ),
              new Tab(
                icon: new Icon(Icons.camera_front),
              ),
            ],
            controller: controller,
          ),
        ),
      ),
    );
  }
}