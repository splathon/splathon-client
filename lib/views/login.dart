import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:openapi/api.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {

  SampleObj _responseObj;

  void _callLoginApi() {    
    var client = new Sample1Api();
    var result = client.getUserById(1);
    result.then(
      (sampleObj) => setState(() { this._responseObj = sampleObj; } )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: SplaText("Login"),
      ),
      body: new Center(
        child: new Form(
          child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'User Id',
                  ),
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  maxLength: 8,
                  decoration: new InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 24.0),
                new Center(
                  child: new RaisedButton(
                    child: SplaText('login'),
                    onPressed: _callLoginApi,
                    /*onPressed: () {
                      // TODO: Implement login function
                      // とりあえず何もせず遷移させる
                      Navigator.of(context).pushReplacementNamed("/home");
                    },*/
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}