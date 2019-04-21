import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';
import 'dart:async';
import 'package:openapi/api.dart' as API;

class Accept extends StatefulWidget {
  @override
  _AcceptState createState() => new _AcceptState();
}

class _AcceptState extends State<Accept> with AutomaticKeepAliveClientMixin {
  QRReaderController controller;
  List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();

    setupCameras();
  }

  @override
  bool get wantKeepAlive => true;

  Future<Null> setupCameras() async {
    cameras = await availableCameras();

    controller = new QRReaderController(cameras[0], ResolutionPreset.medium, [CodeFormat.qr], (dynamic value){
      confirmAccept(value);
      new Future.delayed(const Duration(seconds: 3), controller.startScanning);
    });
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      controller.startScanning();
    });
  }

  // TODO: implement confirm accept view
  confirmAccept(String value) {
    buildDialog(context, value);
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      // Loading
      return new Center(
        child: const CircularProgressIndicator(),
      );
    }
    if (!controller.value.isInitialized) {
      // Loading
      return new Center(
        child: const CircularProgressIndicator(),
      );
    }
    return new AspectRatio(
        aspectRatio:
        controller.value.aspectRatio,
        child: new QRReaderPreview(controller));
  }
  buildDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext build) {
        return new AlertDialog(
          titlePadding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          title: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: splaBlueColor,
            ),
            padding: const EdgeInsets.all(10),
            child: Center(child: Text('エラー', style: popupTitleStyle,),),
          ),
          content: Text('$message', style: popupMessageStyle,),
          actions: <Widget>[
            FlatButton(
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
}