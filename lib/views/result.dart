import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';

/**
 * Reference Google Sample Code
 * https://flutter.dev/docs/catalog/samples/tabbed-app-bar
 */
class ResultTabbedBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: new Stack(
        children: <Widget>[
          TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: TabViewCard(tabView: choices[0],),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: TabViewCard(tabView: choices[1],),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
            child: TabBar(
              isScrollable: false,
              indicatorColor: splaBlueColor,
              labelColor: splaBlueColor,
              labelStyle: tabStyle,
              tabs: choices.map((TabView tabView) {
                return new Container(
                  height: 36.0,
                  child: new Tab(
                    text: tabView.title,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      )
    );
  }

  static const TextStyle tabStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: splaBlueColor,
    fontSize: 18.0,
  );
}

class TabView {
  const TabView({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<TabView> choices = const <TabView>[
  const TabView(title: 'あなたの試合結果'),
  const TabView(title: '全ての試合結果'),
];

class TabViewCard extends StatelessWidget {
  const TabViewCard({Key key, this.tabView}) : super(key: key);

  final TabView tabView;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(tabView.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}