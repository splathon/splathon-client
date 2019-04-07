import 'package:flutter/material.dart';
import 'package:splathon_app/styles/text.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {

static const TextStyle _labelStyle = TextStyle(
  fontFamily: 'Splatfont',
);
static const TextStyle _hintStyle = TextStyle(
  fontFamily: 'Splatfont',
  color: Color.fromRGBO(211, 211, 211, 1),
);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: SplaText('Splathon #10'),
        backgroundColor: Color.fromRGBO(11, 49, 143, 1),
      ),
      body: new Center(
        child: new Form(
          child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(child:
                  Text('ログイン',
                    style: TextStyle(
                      fontFamily: 'Splatfont',
                      fontSize: 40,
                      color: Color.fromRGBO(11, 49, 143, 1),
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'User ID',
                    labelStyle: _labelStyle,
                    hintText: 'splathon#10',
                    hintStyle: _hintStyle,
                  ),
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
                ),
                const SizedBox(height: 60.0),
                new Container(
                  height: 60,
                  child: new RaisedButton(
                    color: Color.fromRGBO(247, 166, 0, 1),
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
                      // TODO: Implement login function
                      // とりあえず何もせず遷移させる
                      Navigator.of(context).pushReplacementNamed("/home");
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
}