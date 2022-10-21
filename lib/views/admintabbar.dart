import 'package:flutter/material.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/utils/event.dart';
import 'package:splathon_app/views/accept.dart';
import 'package:splathon_app/views/allresult.dart';

class AdminTabbedBar extends StatefulWidget {
  @override
  AdminTabbedBarState createState() => AdminTabbedBarState();
}

class AdminTabbedBarState extends State<AdminTabbedBar>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  reload() {
    switch (controller.index) {
      case 0:
        Event.bus.fire(AllResultReload());
        return;
      case 1:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SplaText('Splathon #11 for Admin'),
        backgroundColor: const Color.fromRGBO(11, 49, 143, 1),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/images/reloadIcon.png'),
            onPressed: reload,
          ),
        ],
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: <Widget>[
          const AllResult(),
          Accept(),
        ],
      ),
      bottomNavigationBar: Material(
        color: splaBlueColor,
        child: SafeArea(
          child: TabBar(
            isScrollable: false,
            tabs: <Tab>[
              Tab(
                icon: Image.asset('assets/images/icon_result.png'),
                child: const Text(
                  'レポート',
                  style: tabTextStyle,
                ),
              ),
              Tab(
                icon: Image.asset('assets/images/icon_reception.png'),
                child: const Text(
                  'QR受付',
                  style: tabTextStyle,
                ),
              ),
            ],
            controller: controller,
          ),
        ),
      ),
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

  static const TextStyle tabTextStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: Colors.white,
    fontSize: 15.0,
  );
}
