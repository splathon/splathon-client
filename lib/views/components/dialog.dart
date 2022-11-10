import 'package:flutter/material.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/text_style.dart';

class NormalDialog {
  static Future show(BuildContext context, String title, String body) {
    return showDialog(
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
            body,
            style: popupMessageStyle,
          ),
          actions: <Widget>[
            TextButton(
              child: const SplaText('閉じる'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ],
        );
      },
    );
  }
}

class ErrorDialog {
  static Future show(BuildContext context, String message) {
    return NormalDialog.show(context, 'エラー', message);
  }
}
