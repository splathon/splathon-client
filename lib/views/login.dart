import 'package:flutter/material.dart';
import 'package:openapi/api.dart' as API;
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:splathon_app/utils/preference.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _userIdController = TextEditingController();
  final _passwordController = TextEditingController();
  late API.LoginResponse _model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SplaText('Splathon #${Config.eventNumber}'),
        backgroundColor: splaBlueColor,
      ),
      body: Center(
        child: Form(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'User ID',
                    labelStyle: _labelStyle,
                    hintText: 'splathon#${Config.eventNumber}',
                    hintStyle: _hintStyle,
                  ),
                  controller: _userIdController,
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  maxLength: 20,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: _labelStyle,
                    hintText: '2525splatoon',
                    hintStyle: _hintStyle,
                  ),
                  controller: _passwordController,
                ),
                const SizedBox(height: 60.0),
                SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: splaYellowColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                    ),
                    child: const Text(
                      'ログイン',
                      style: TextStyle(
                        fontFamily: 'Splatfont',
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      login();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    var client = API.DefaultApi();
    API.LoginRequest loginRequest = API.LoginRequest(
        userId: _userIdController.text, password: _passwordController.text);
    var result = client.login(Config.eventNumber, loginRequest);
    result
        .then((rankingObj) => setState(() {
              if (rankingObj == null) {
                // TODO: null case
                return;
              }
              _model = rankingObj;
              successLogin();
            }))
        .catchError((onError) {
      buildDialog(context, 'ログインに失敗しました');
    });
  }

  void successLogin() async {
    Preference().setToken(_model.token);
    Preference().setIsAdmin(_model.isAdmin);
    if (_model.team != null) {
      Preference().setTeamId(_model.team!.id);
      Preference().setTeamName(_model.team!.name);
    }

    if (_model.isAdmin) {
      Navigator.of(context).pushReplacementNamed("/admin");
    } else {
      Navigator.of(context).pushReplacementNamed("/home");
    }
  }

  buildDialog(BuildContext context, String message) {
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
            child: const Center(
              child: Text(
                'エラー',
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

  static const TextStyle _labelStyle = TextStyle(
    fontFamily: 'Splatfont',
  );
  static const TextStyle _hintStyle = TextStyle(
    fontFamily: 'Splatfont',
    color: Color.fromRGBO(211, 211, 211, 1),
  );

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
