import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:splathon_app/domains/reception_provider.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text_style.dart';
import 'package:splathon_app/views/components/dialog.dart';

class Accept extends ConsumerStatefulWidget {
  const Accept({super.key});

  @override
  AcceptState createState() => AcceptState();
}

class AcceptState extends ConsumerState<Accept>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isVisibleQRScanView = true;

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

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Stack(
      children: [
        isVisibleQRScanView
            ? QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              )
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('非撮影モード', style: largeBlackTextStyle),
                    const SizedBox(height: 30),
                    Opacity(
                      opacity: 0.5,
                      child: Image.asset('assets/images/girl.png'),
                    ),
                  ],
                ),
              ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: IconButton(
                onPressed: () {
                  setState(() => isVisibleQRScanView = !isVisibleQRScanView);
                  isVisibleQRScanView
                      ? controller?.resumeCamera()
                      : controller?.pauseCamera();
                },
                iconSize: 64,
                color: splaBlueColor,
                icon: Icon(isVisibleQRScanView
                    ? Icons.disabled_visible
                    : Icons.camera_outlined)),
          ),
        ),
      ],
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

  Future confirmAccept(String code) async {
    final state = ref.read(receptionStateProvider);
    if (state == ReceptionState.ready) {
      ref
          .read(receptionStateProvider.notifier)
          .recept(code: code)
          .then((reception) => buildConfirmDialog(context, reception))
          .catchError((error, stackTrace) {});
    }
  }

  buildConfirmDialog(
      BuildContext context, ReceptionPartcipantsDataResponse reception) {
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

  List<Widget> receptionViews(ReceptionPartcipantsDataResponse receptionData) {
    return [hasCompanionView(receptionData)] +
        receptionData.participants
            .map((participant) => receptionView(participant))
            .toList() +
        [completeButtonView()];
  }

  Widget hasCompanionView(ReceptionPartcipantsDataResponse receptionData) {
    final hasCompanion =
        receptionData.participants.indexWhere((a) => a.hasCompanion == true) !=
            -1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset('assets/images/silverInc.png'),
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text('同伴者', style: headerStyle),
                  ),
                ],
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
    );
  }

  Widget receptionView(ParticipantReception reception) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        receptionColumnView(
          title: '名前',
          body: '${reception.fullnameKana} さん',
          index: 0,
        ),
        receptionColumnView(
          title: 'ニックネーム',
          body: '${reception.nickname} さん',
          index: 1,
        ),
        receptionColumnView(
          title: 'チーム名',
          body: reception.teamName ??= 'チームなし',
          index: 2,
        ),
        receptionColumnView(
          title: '区分',
          body: attendType(reception.isPlayer, reception.isStaff),
          index: 3,
        ),
        receptionColumnView(
          title: '会費',
          body: '${reception.participantFee}円',
          index: 4,
        ),
        receptionColumnView(
          title: 'ドック有無',
          body: reception.hasSwitchDock ? 'あり' : 'なし',
          index: 5,
        ),
        receptionColumnView(
          title: '懇親会',
          body: reception.joinParty ? '参加' : '不参加',
          index: 6,
        ),
        receptionColumnView(
          title: '備考',
          body: reception.receptionMemo ?? '',
          index: 7,
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          color: borderColor,
          height: 1,
          width: double.maxFinite,
        ),
      ],
    );
  }

  Widget receptionColumnView(
      {required String title, required String body, required int index}) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(index % 2 == 0
                  ? 'assets/images/goldInc.png'
                  : 'assets/images/silverInc.png'),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(title, style: headerStyle),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            body,
            style: headerStyle,
            maxLines: 1,
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
                Navigator.pop(context, false);
                ref.read(receptionStateProvider.notifier).cancel();
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
                ref
                    .read(receptionStateProvider.notifier)
                    .completeReception()
                    .then(
                  (_) async {
                    Navigator.pop(context, false);
                    await NormalDialog.show(context, '受付', '受付を完了しました！');
                    ref.read(receptionStateProvider.notifier).finish();
                  },
                ).catchError(
                  (error, stackTrace) async {
                    await ErrorDialog.show(context, '受付に失敗しました');
                    ref.read(receptionStateProvider.notifier).finish();
                  },
                );
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
