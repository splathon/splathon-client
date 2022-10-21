import 'package:flutter/material.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/utils/event.dart';
import 'package:splathon_app/views/enter.dart';

class ReceptionTabbedBar extends StatefulWidget {
  const ReceptionTabbedBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ReceptionTabbedBarState();
  }
}

class _ReceptionTabbedBarState extends State<ReceptionTabbedBar>
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
    Event.bus.on<ReceptionReload>().listen((_) {
      switch (controller.index) {
        case 0:
          Event.bus.fire(EnterBuildingReload());
          return;
        case 1:
          Event.bus.fire(EnterSplathonReload());
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
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: Enter(true),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: Enter(false),
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
          )
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
  TabView(title: 'ビル入館ゲート'),
  TabView(title: '会場入場コード'),
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
