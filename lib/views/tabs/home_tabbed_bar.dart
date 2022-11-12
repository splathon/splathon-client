import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splathon_app/domains/notification_provider.dart';
import 'package:splathon_app/domains/ranking_provider.dart';
import 'package:splathon_app/domains/reception_provider.dart';
import 'package:splathon_app/domains/result_provider.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/text_style.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:splathon_app/views/components/dialog.dart';
import 'package:splathon_app/views/notifications/notification.dart';
import 'package:splathon_app/views/rankings/rankings.dart';
import 'package:splathon_app/views/receptions/reception.dart';
import 'package:splathon_app/views/results/result.dart';

/// Reference
/// https://github.com/nisrulz/flutter-examples/blob/master/using_bottom_nav_bar/lib/main.dart
class HomeTabbedBar extends ConsumerStatefulWidget {
  const HomeTabbedBar({super.key});

  @override
  HomeTabbedBarState createState() => HomeTabbedBarState();
}

// SingleTickerProviderStateMixin is used for animation
class HomeTabbedBarState extends ConsumerState<HomeTabbedBar>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 4, vsync: this);
    _setupFirebaseCloudMessaging(context);
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
        title: SplaText('Splathon #${Config.eventNumber}'),
        backgroundColor: const Color.fromRGBO(11, 49, 143, 1),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/reloadIcon.png'),
            onPressed: () {
              switch (controller.index) {
                case 0:
                  ref.read(notificationStateProvider.notifier).load();
                  ref.read(noticeReadtimeProvider.notifier).load();
                  return;
                case 1:
                  ref.read(resultProvider.notifier).load();
                  ref.refresh(resultsProvider);
                  return;
                case 2:
                  ref.refresh(rankingProvider);
                  return;
                case 3:
                  ref.refresh(receptionProvider);
                  return;
              }
            },
          ),
        ],
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const <Widget>[
          Notifications(),
          ResultTabbedBar(),
          Rankings(),
          ReceptionTabbedBar(),
        ],
      ),
      bottomNavigationBar: Material(
        color: splaBlueColor,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: kIsWeb &&
                        (defaultTargetPlatform == TargetPlatform.iOS ||
                            defaultTargetPlatform == TargetPlatform.macOS)
                    ? 20
                    : 0),
            child: TabBar(
              isScrollable: false,
              tabs: <Tab>[
                Tab(
                  icon: Image.asset('assets/images/icon_notification.png'),
                  iconMargin: const EdgeInsets.only(bottom: 0),
                  child: const Text(
                    'お知らせ',
                    style: bottomTabTextStyle,
                  ),
                ),
                Tab(
                  icon: Image.asset('assets/images/icon_result.png'),
                  iconMargin: const EdgeInsets.only(bottom: 0),
                  child: const Text(
                    'リザルト',
                    style: bottomTabTextStyle,
                  ),
                ),
                Tab(
                  icon: Image.asset('assets/images/icon_ranking.png'),
                  iconMargin: const EdgeInsets.only(bottom: 0),
                  child: const Text(
                    'ランキング',
                    style: bottomTabTextStyle,
                  ),
                ),
                Tab(
                  icon: Image.asset('assets/images/icon_reception.png'),
                  iconMargin: const EdgeInsets.only(bottom: 0),
                  child: const Text(
                    '受付コード',
                    style: bottomTabTextStyle,
                  ),
                ),
              ],
              controller: controller,
            ),
          ),
        ),
      ),
    );
    //   },
    // );
  }

  void _setupFirebaseCloudMessaging(BuildContext context) async {
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (kIsWeb) {
      final _ = await messaging.getToken(vapidKey: Config.vapidKey);
      // need token for firebase cloud message test
    }

    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      if (notification != null) {
        buildDialog(context, notification);
      }
    });
  }

  buildDialog(BuildContext context, RemoteNotification notification) {
    String title = notification.title ?? 'お知らせ';
    String? body = notification.body;
    if (body == null) return;

    NormalDialog.show(context, title, body);
  }
}
