import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'dart:async';
import 'dart:ui';
import 'package:qr_flutter/qr_flutter.dart';

class EnterBuilding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget>[
        new Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SplaText('ダミーテキスト入館する際にセキュリティゲートに発行した入館証（QRコード）をかざすと、ゲートが開きます。そのまま13階にお上がりください。ダミーテキストダミーテキストダミーテキストダミーテキストダミーテキストダミーテキスト'),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
          padding: const EdgeInsets.all(40),
          child: Column(
            children: <Widget>[
              QrImage(
                data: 'ビル入館コード',
                size: 250,
              ),
              SizedBox(height: 40),
              SplaText('何かあればこちらにテキスト挿入,')
            ],
          )
        ),
        new Expanded(
          child: Center(
            child: SplaText('余白!'),
          )
        )
      ]
    );
  }
}