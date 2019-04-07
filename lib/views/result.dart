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
          TabBar(
            isScrollable: false,
            indicatorColor: splaBlueColor,
            labelColor: splaBlueColor,
            tabs: choices.map((TabView tabView) {
              return new Container(
                height: 70.0,
                child: new Tab(
                  text: tabView.title,
                  icon: Icon(tabView.icon),
                ),
              );
            }).toList(),
          ),
          TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: TabViewCard(tabView: choices[0],),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: TabViewCard(tabView: choices[1],),
              ),
            ],
          ),
        ],
      )
    );
  }
}

class TabView {
  const TabView({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<TabView> choices = const <TabView>[
  const TabView(title: 'あなたの試合結果', icon: Icons.assignment_ind),
  const TabView(title: '全ての試合結果', icon: Icons.whatshot),
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
            Icon(tabView.icon, size: 128.0, color: textStyle.color),
            Text(tabView.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}