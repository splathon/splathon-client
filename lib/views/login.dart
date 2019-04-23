import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/color.dart';
import 'dart:async';
import 'package:openapi/api.dart' as API;
import 'package:splathon_app/utils/preference.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  final _userIdController = TextEditingController();
  final _passwordController = TextEditingController();
  API.LoginRequest loginRequest = API.LoginRequest();
  API.LoginResponse _model;
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: SplaText('Splathon #10'),
        backgroundColor: splaBlueColor,
      ),
      body: new Center(
        child: new Form(
          child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new TextFormField(
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'User ID',
                    labelStyle: _labelStyle,
                    hintText: 'splathon#10',
                    hintStyle: _hintStyle,
                  ),
                  controller: _userIdController,
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  maxLength: 20,
                  decoration: new InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: _labelStyle,
                    hintText: '2525splatoon',
                    hintStyle: _hintStyle,
                  ),
                  controller: _passwordController,
                ),
                const SizedBox(height: 60.0),
                new Container(
                  height: 60,
                  child: new RaisedButton(
                    color: splaYellowColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))
                    ),
                    child: Text('ログイン',
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
    var client = new API.DefaultApi();
    loginRequest.userId = _userIdController.text;
    loginRequest.password = _passwordController.text;
    var result = client.login(9, loginRequest);
    result.then(
      (rankingObj) => setState(() {
          this._model = rankingObj; 
          successLogin();
      } )
    ).catchError((onError) {
      buildDialog(context, 'ログインに失敗しました');
    });
  }

  void successLogin() async {
    Preference().setToken(_model.token);
    Preference().setIsAdmin(_model.isAdmin);

    if (_model.isAdmin != null) {
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