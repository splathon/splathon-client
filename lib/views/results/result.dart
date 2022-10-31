import 'package:flutter/material.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text_style.dart';
import 'package:splathon_app/views/results/allresult.dart';
import 'package:splathon_app/views/results/myresult.dart';

class ResultTabbedBar extends StatefulWidget {
  const ResultTabbedBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ResultTabbedBarState();
  }
}

class _ResultTabbedBarState extends State<ResultTabbedBar>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      color: backgroundColor,
      child: Stack(
        children: <Widget>[
          TabBarView(
            controller: controller,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: EachResult(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: AllResult(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: TabBar(
              isScrollable: false,
              indicatorColor: splaBlueColor,
              labelColor: splaBlueColor,
              labelStyle: upperTabTextStyle,
              tabs: choices.map((TabView tabView) {
                return SizedBox(
                  height: 40.0,
                  child: Tab(
                    text: tabView.title,
                  ),
                );
              }).toList(),
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}

class TabView {
  const TabView({required this.title, this.icon});

  final String title;
  final IconData? icon;
}

const List<TabView> choices = <TabView>[
  TabView(title: '各チームの試合結果'),
  TabView(title: '全ての試合結果'),
];

class TabViewCard extends StatelessWidget {
  const TabViewCard({required Key key, required this.tabView})
      : super(key: key);

  final TabView tabView;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.headline4;
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
