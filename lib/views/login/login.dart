import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splathon_app/domains/user_provider.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/text_style.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:splathon_app/views/components/dialog.dart';

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
                    labelStyle: formLabelStyle,
                    hintText: 'splathon#${Config.eventNumber}',
                    hintStyle: formHintStyle,
                  ),
                  controller: _userIdController,
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  maxLength: 20,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: formLabelStyle,
                    hintText: '2525splatoon',
                    hintStyle: formHintStyle,
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
                      style: actionButtonStyle,
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
      ErrorDialog.show(context, 'ログインに失敗しました');
    });
  }
}
