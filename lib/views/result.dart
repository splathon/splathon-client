import 'package:flutter/material.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/utils/event.dart';
import 'package:splathon_app/views/allresult.dart';
import 'package:splathon_app/views/myresult.dart';

class ResultTabbedBar extends StatefulWidget {
  //const ResultTabbedBar({required Key key}) : super(key: key);

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
    listenReloadEvent();
  }

  @override
  bool get wantKeepAlive => true;

  listenReloadEvent() async {
    Event().bus.on<ResultReload>().listen((_) {
      switch (controller.index) {
        case 0:
          Event().bus.fire(MyResultReload());
          return;
        case 1:
          Event().bus.fire(AllResultReload());
          return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Stack(
        children: <Widget>[
          TabBarView(
            controller: controller,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: EachResult(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: AllResult(), //ResultDetail(),
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

  static const TextStyle tabStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: splaBlueColor,
    fontSize: 18.0,
  );
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
