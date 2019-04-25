import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/views/allresult.dart';
import 'package:splathon_app/views/accept.dart';
import 'package:splathon_app/views/customTabs.dart' as CustomView;

class AdminTabbedBar extends StatefulWidget {
  @override
  AdminTabbedBarState createState() => new AdminTabbedBarState();
}

class AdminTabbedBarState extends State<AdminTabbedBar> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();

    controller = new TabController(length: 2, vsync: this);
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
        title: SplaText('Splathon #10 for Admin'),
        backgroundColor: Color.fromRGBO(11, 49, 143, 1),
      ),
      body: new TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
            AllResult(),
            Accept(),
          ],
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        color: splaBlueColor,
        child: SafeArea(child: 
          new TabBar(
            isScrollable: false,
            tabs: <CustomView.Tab>[
              new CustomView.Tab(
                child: Text('レポート', style: tabTextStyle,),
                icon: Image.asset('assets/images/icon_result.png'),
              ),
              new CustomView.Tab(
                child: Text('QR受付', style: tabTextStyle,),
                icon: Image.asset('assets/images/icon_reception.png'),
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