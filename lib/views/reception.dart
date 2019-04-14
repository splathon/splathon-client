import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/views/enterbuilding.dart';

/**
 * Reference Google Sample Code
 * https://flutter.dev/docs/catalog/samples/tabbed-app-bar
 */
class ReceptionTabbedBar extends StatelessWidget {
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
                child: new EnterBuilding(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: new EnterBuilding(), // TODO: レイアウトは一緒だと思うのでLayout Fixするまで一旦コピー
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: TabBar(
              isScrollable: false,
              indicatorColor: splaBlueColor,
              labelColor: splaBlueColor,
              labelStyle: tabStyle,
              tabs: choices.map((TabView tabView) {
                return new Container(
                  height: 40.0,
                  child: new Tab(
                    text: tabView.title,
                  ),
                );
              }).toList(),
            ),
          )
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
  const TabView(title: 'ビル入館ゲート'),
  const TabView(title: '会場入場コード'),
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