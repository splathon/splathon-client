import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';

/**
 * Reference Google Sample Code
 * https://flutter.dev/docs/catalog/samples/tabbed-app-bar
 */
class HomeTabbedBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: SplaText('Splathon #10'),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map((TabView tabView) {
                return Tab(
                  text: tabView.title,
                  icon: Icon(tabView.icon),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: choices.map((TabView tabView) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: TabViewCard(tabView: tabView,),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class TabView {
  const TabView({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<TabView> choices = const <TabView>[
  const TabView(title: 'お知らせ', icon: Icons.sms),
  const TabView(title: 'リザルト', icon: Icons.whatshot),
  const TabView(title: 'ランキング', icon: Icons.format_list_numbered),
  const TabView(title: '受付コード', icon: Icons.camera_front),
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