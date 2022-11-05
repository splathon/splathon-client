import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splathon_app/domains/user_provider.dart';
import 'package:splathon_app/views/components/loader.dart';

class Splash extends HookConsumerWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: 100msecでいいのかどうか・・
    Future.delayed(const Duration(milliseconds: 100)).then((value) {
      final user = ref.read(userStateProvider);
      if (user == null) {
        Navigator.of(context).pushReplacementNamed('/login');
      } else {
        Navigator.of(context)
            .pushReplacementNamed(user.isAdmin ? '/admin' : '/home');
      }
    });

    return const Scaffold(
      body: Center(
        child: ColorLoader(),
      ),
    );
  }
}
