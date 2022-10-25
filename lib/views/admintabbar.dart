import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splathon_app/domains/result_provider.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/text_style.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:splathon_app/views/accept.dart';
import 'package:splathon_app/views/allresult.dart';

class AdminTabbedBar extends ConsumerStatefulWidget {
  const AdminTabbedBar({super.key});

  @override
  AdminTabbedBarState createState() => AdminTabbedBarState();
}

class AdminTabbedBarState extends ConsumerState<AdminTabbedBar>
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SplaText('Splathon #${Config.eventNumber} for Admin'),
        backgroundColor: const Color.fromRGBO(11, 49, 143, 1),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/images/reloadIcon.png'),
            onPressed: () {
              switch (controller.index) {
                case 0:
                  ref.refresh(resultsProvider);
                  return;
                case 1:
                  return;
              }
            },
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
                  style: bottomTabTextStyle,
                ),
              ),
              Tab(
                icon: Image.asset('assets/images/icon_reception.png'),
                child: const Text(
                  'QR受付',
                  style: bottomTabTextStyle,
                ),
              ),
            ],
            controller: controller,
          ),
        ),
      ),
    );
  }
}
