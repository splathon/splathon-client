import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:openapi/api.dart' as API;
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text_style.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:splathon_app/utils/preference.dart';
import 'package:splathon_app/views/components/dialog.dart';

class Accept extends StatefulWidget {
  const Accept({super.key});

  @override
  AcceptState createState() => AcceptState();
}

// TODO: QRコード読み取りライブラリのIntegration iOSしかやってない
// https://pub.dev/packages/qr_code_scanner#android-integration
class AcceptState extends State<Accept> with AutomaticKeepAliveClientMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  API.ReceptionPartcipantsDataResponse? _receptionModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  bool get wantKeepAlive => true;

  bool isCompleting = false;
  late String scannedCode;

  Future fetchReceptionData(String receptionCode) async {
    var client = API.ReceptionApi();
    String token = Preference.getToken();
    var result = client.getParticipantsDataForReception(
        Config.eventNumber, receptionCode, token);
    result.then((resultsObj) => setState(() {
          _receptionModel = resultsObj;
        }));
  }

  // TODO: implement confirm accept view
  Future confirmAccept(String value) async {
    if (isCompleting) {
      return;
    }
    isCompleting = true;

    var client = API.ReceptionApi();
    String token = Preference.getToken();
    var result = client.getParticipantsDataForReception(
        Config.eventNumber, value, token);
    result.then((resultsObj) {
      if (resultsObj == null) {
        return;
      }
      buildConfirmDialog(context, resultsObj);
    }).catchError((onError) {
      isCompleting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      final code = scanData.code;
      if (code == null) {
        return;
      }
      confirmAccept(code);
    });
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
                style: actionButtonStyle,
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
                style: actionButtonStyle,
              ),
              onPressed: () {
                var client = API.ReceptionApi();
                String token = Preference.getToken();
                var result = client.completeReception(
                    Config.eventNumber, scannedCode, token);
                result.then((resultObjet) {
                  isCompleting = false;
                  Navigator.pop(context, false);
                  NormalDialog.show(context, '受付', '受付を完了しました！');
                }).catchError((onError) {
                  isCompleting = false;
                  ErrorDialog.show(context, '受付に失敗しました');
                });
              },
            ),
          ],
        ));
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
}
