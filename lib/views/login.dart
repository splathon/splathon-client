import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splathon_app/domains/user_provider.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/utils/config.dart';

class Login extends HookConsumerWidget {
  Login({super.key});

  final _userIdController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      login(context, ref);
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

  void login(BuildContext context, WidgetRef ref) async {
    ref
        .read(userStateProvider.notifier)
        .login(
            userId: _userIdController.text, password: _passwordController.text)
        .then(
      (user) {
        if (user.isAdmin) {
          Navigator.of(context).pushReplacementNamed("/admin");
        } else {
          Navigator.of(context).pushReplacementNamed("/home");
        }
      },
    ).catchError((error, stackTrace) {
      buildDialog(context, 'ログインに失敗しました');
    });
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
