import 'dart:async';

import 'package:flutter/material.dart';
import 'package:openapi/api.dart' as API;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:splathon_app/utils/event.dart';
import 'package:splathon_app/utils/preference.dart';

class Enter extends StatefulWidget {
  final bool _isBuilding;
  const Enter(this._isBuilding);

  @override
  _EnterState createState() => _EnterState(_isBuilding);
}

class _EnterState extends State<Enter> with AutomaticKeepAliveClientMixin {
  final bool _isBuilding;
  _EnterState(this._isBuilding);

  API.ReceptionResponse? _model;

  @override
  void initState() {
    super.initState();
    fetchData();
    listenReloadEvent();
  }

  @override
  bool get wantKeepAlive => true;

  Future fetchData() async {
    var client = API.ReceptionApi();
    String token = Preference().getToken();
    var result = client.getReception(Config().eventNumber, token);
    result.then((resultsObj) => setState(() {
          _model = resultsObj;
        }));
  }

  listenReloadEvent() async {
    if (_isBuilding) {
      Event().bus.on<EnterBuildingReload>().listen((_) {
        setState(() {
          _model = null;
          fetchData();
        });
      });
    } else {
      Event().bus.on<EnterSplathonReload>().listen((_) {
        setState(() {
          _model = null;
          fetchData();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_model == null) {
      // Loading
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    API.ReceptionCode? reception =
        _isBuilding ? _model?.building : _model?.splathon;
    if (reception == null) {
      // TODO: null case
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Container(
      color: backgroundColor,
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, i) {
          if (i == 0) {
            return Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: SplaText(reception.description!),
            );
          }
          return Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
            padding: const EdgeInsets.all(40),
            child: Column(
              children: <Widget>[
                QrImage(
                  data: reception.code!,
                  size: 250,
                ),
                const SizedBox(height: 40),
                reception.shortText == null
                    ? Container()
                    : SplaText(reception.shortText!),
              ],
            ),
          );
        },
      ),
    );
  }
}
