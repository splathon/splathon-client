import 'dart:async';

//import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart' as API;
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:splathon_app/utils/preference.dart';

class Accept extends StatefulWidget {
  @override
  _AcceptState createState() => _AcceptState();
}

// TODO: QR読み取り機能がFlutter3, Dart2アップデートに耐えられなかったので別のもので代替する
class _AcceptState extends State<Accept> with AutomaticKeepAliveClientMixin {
  //late QRReaderController controller;
  //late List<CameraDescription> cameras;

  API.ReceptionPartcipantsDataResponse? _receptionModel;

  @override
  void initState() {
    super.initState();

    setupCameras();
  }

  @override
  bool get wantKeepAlive => true;

  bool isCompleting = false;
  late String scannedCode;

  Future fetchReceptionData(String receptionCode) async {
    var client = API.ReceptionApi();
    String token = Preference().getToken();
    var result = client.getParticipantsDataForReception(
        Config.eventNumber, receptionCode, token);
    result.then((resultsObj) => setState(() {
          _receptionModel = resultsObj;
        }));
  }

  Future<void> setupCameras() async {
    // cameras = await availableCameras();

    // controller = QRReaderController(
    //     cameras[0], ResolutionPreset.high, [CodeFormat.qr], (dynamic value) {
    //   confirmAccept(value);
    //   scannedCode = value;
    //   Future.delayed(const Duration(seconds: 3), controller.startScanning);
    // });
    // controller.initialize().then((_) {
    //   if (!mounted) {
    //     return;
    //   }
    //   setState(() {});
    //   controller.startScanning();
    // });
  }

  // TODO: implement confirm accept view
  Future confirmAccept(String value) async {
    if (isCompleting) {
      return;
    }
    isCompleting = true;

    var client = API.ReceptionApi();
    String token = Preference().getToken();
    var result = client.getParticipantsDataForReception(
        Config.eventNumber, value, token);
    // result.then((resultsObj) {
    //   buildConfirmDialog(context, resultsObj);
    // }).catchError((onError) {
    //   isCompleting = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    //if (controller == null) {
    // Loading
    return const Center(
      child: CircularProgressIndicator(),
    );
    // }
    // if (!controller.value.isInitialized) {
    //   // Loading
    //   return const Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }
    // return AspectRatio(
    //     aspectRatio: controller.value.aspectRatio,
    //     child: QRReaderPreview(controller));
  }

  buildConfirmDialog(
      BuildContext context, API.ReceptionPartcipantsDataResponse reception) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext build) {
        return SimpleDialog(
          titlePadding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          title: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: splaBlueColor,
            ),
            padding: const EdgeInsets.all(10),
            child: const Center(
              child: Text(
                '受付',
                style: popupTitleStyle,
              ),
            ),
          ),
          children: receptionViews(reception),
        );
      },
    );
  }

  List<Widget> receptionViews(
      API.ReceptionPartcipantsDataResponse receptionData) {
    return [hasCompanionView(receptionData)] +
        receptionData.participants
            .map((participant) => receptionView(participant))
            .toList() +
        [completeButtonView()];
  }

  Widget hasCompanionView(API.ReceptionPartcipantsDataResponse receptionData) {
    final hasCompanion =
        receptionData.participants.indexWhere((a) => a.hasCompanion == true) !=
            -1;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Image.asset('assets/images/silverInc.png'),
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text('同伴者', style: headerStyle),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  child: hasCompanion
                      ? const Text(
                          'あり',
                          style: hasCompanionStyle,
                          maxLines: 1,
                        )
                      : const Text(
                          'なし',
                          style: headerStyle,
                          maxLines: 1,
                        ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            color: borderColor,
            height: 1,
            width: double.maxFinite,
          )
        ],
      ),
    );
  }

  Widget receptionView(API.ParticipantReception reception) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Image.asset('assets/images/goldInc.png'),
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text('名前', style: headerStyle),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(
                    '${reception.fullnameKana} さん',
                    style: headerStyle,
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Image.asset('assets/images/silverInc.png'),
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text('ニックネーム', style: headerStyle),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(
                    '${reception.nickname} さん',
                    style: headerStyle,
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Image.asset('assets/images/goldInc.png'),
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text('チーム名', style: headerStyle),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(
                    reception.teamName ??= 'チームなし',
                    style: headerStyle,
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Image.asset('assets/images/silverInc.png'),
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text('区分', style: headerStyle),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(
                    attendType(reception.isPlayer, reception.isStaff),
                    style: headerStyle,
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Image.asset('assets/images/goldInc.png'),
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text('会費', style: headerStyle),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(
                    '${reception.participantFee}円',
                    style: headerStyle,
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Image.asset('assets/images/silverInc.png'),
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text('ドック有無', style: headerStyle),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(
                    reception.hasSwitchDock ? 'あり' : 'なし',
                    style: headerStyle,
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Image.asset('assets/images/goldInc.png'),
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text('懇親会', style: headerStyle),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(
                    reception.joinParty ? '参加' : '不参加',
                    style: headerStyle,
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            color: borderColor,
            height: 1,
            width: double.maxFinite,
          )
        ],
      ),
    );
  }

  Widget completeButtonView() {
    return Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
        child: Row(
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: drawColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
              ),
              child: const Text(
                'キャンセル',
                style: TextStyle(
                  fontFamily: 'Splatfont',
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                isCompleting = false;
                Navigator.pop(context, false);
              },
            ),
            const SizedBox(
              width: 16,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: splaYellowColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
              ),
              child: const Text(
                '受付する',
                style: TextStyle(
                  fontFamily: 'Splatfont',
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                var client = API.ReceptionApi();
                String token = Preference().getToken();
                var result = client.completeReception(
                    Config.eventNumber, scannedCode, token);
                result.then((resultObjet) {
                  isCompleting = false;
                  Navigator.pop(context, false);
                  buildDialog(context, '受付', '受付を完了しました！');
                }).catchError((onError) {
                  isCompleting = false;
                  buildDialog(context, 'エラー', '受付に失敗しました');
                });
              },
            ),
          ],
        ));
  }

  buildDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext build) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          title: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: splaBlueColor,
            ),
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                title,
                style: popupTitleStyle,
              ),
            ),
          ),
          content: Text(
            message,
            style: popupMessageStyle,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CLOSE'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ],
        );
      },
    );
  }

  String attendType(bool isPlayer, bool isStaff) {
    if (isStaff) {
      return 'スタッフ';
    }
    if (isPlayer) {
      return '選手';
    }
    return '観戦';
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

  static const TextStyle headerStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: blackColor,
    fontSize: 18.0,
  );

  static const TextStyle hasCompanionStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: Colors.red,
    fontSize: 18.0,
  );
}
