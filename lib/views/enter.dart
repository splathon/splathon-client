import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/utils/preference.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:async';
import 'package:openapi/api.dart' as API;

class Enter extends StatefulWidget {
  bool _isBuilding;
  Enter(this._isBuilding);
  
  @override
  _EnterState createState() => _EnterState(_isBuilding);
}

class _EnterState extends State<Enter> with AutomaticKeepAliveClientMixin {
  bool _isBuilding;
  _EnterState(this._isBuilding);

  API.ReceptionResponse _model;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  bool get wantKeepAlive => true;

  Future fetchData() async {
    var client = new API.ReceptionApi();
    String token = Preference().getToken();
    var result = client.getReception(9, token);
    result.then(
      (resultsObj) => setState(() { this._model = resultsObj; } )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    if (_model == null) {
      // Loading
      return new Center(
        child: const CircularProgressIndicator(),
      );
    }

    API.ReceptionCode reception = _isBuilding ? _model.building : _model.splathon;

    return Container(
      color: backgroundColor,
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, i) {
          if (i == 0) {
            return Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: SplaText(reception.description),
            );
          }
          return Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
            padding: const EdgeInsets.all(40),
            child: Column(
              children: <Widget>[
                QrImage(
                  data: reception.code,
                  size: 250,
                ),
                SizedBox(height: 40),
                reception.shortText == null ? Container() : SplaText(reception.shortText),
              ],
            ),
          );
        },
      ),
    );
  }
}