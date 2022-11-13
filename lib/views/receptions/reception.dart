import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splathon_app/domains/reception_provider.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text_style.dart';
import 'package:splathon_app/views/components/error_view.dart';
import 'package:splathon_app/views/components/loader.dart';
import 'package:splathon_app/views/receptions/enter.dart';

class ReceptionTabbedBar extends ConsumerStatefulWidget {
  const ReceptionTabbedBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ReceptionTabbedBarState();
  }
}

class _ReceptionTabbedBarState extends ConsumerState<ReceptionTabbedBar>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final reception = ref.watch(receptionProvider);

    return reception.when(
      data: ((data) {
        final tabModels =
            [data.building, data.splathon].where((e) => e != null);
        if (tabModels.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('受付情報はありません', style: largeBlackTextStyle),
              const SizedBox(height: 30),
              Opacity(
                opacity: 0.5,
                child: Image.asset('assets/images/girl.png'),
              ),
            ],
          );
        }
        controller = TabController(length: tabModels.length, vsync: this);
        return Container(
          color: backgroundColor,
          child: Stack(
            children: <Widget>[
              TabBarView(
                controller: controller,
                children: [
                  if (data.building != null)
                    const Padding(
                      padding: EdgeInsets.only(top: 60.0),
                      child: Enter(isBuilding: true),
                    ),
                  if (data.splathon != null)
                    const Padding(
                      padding: EdgeInsets.only(top: 60.0),
                      child: Enter(isBuilding: false),
                    ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: TabBar(
                  isScrollable: false,
                  indicatorColor: splaBlueColor,
                  labelColor: splaBlueColor,
                  labelStyle: upperTabTextStyle,
                  tabs: <TabView>[
                    if (data.building != null) const TabView(title: 'ビル入館ゲート'),
                    if (data.splathon != null) const TabView(title: '会場入場コード'),
                  ].map((TabView tabView) {
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
      }),
      error: (error, stackTrace) => ErrorView(
        error: error,
        retryPressed: () => ref.refresh(receptionProvider),
      ),
      loading: () => const ColorLoader(),
    );
  }
}

class TabView {
  const TabView({required this.title, this.icon});

  final String title;
  final IconData? icon;
}

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
