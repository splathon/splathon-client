import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/text_style.dart';

class ErrorView extends ConsumerWidget {
  const ErrorView({Key? key, required this.error, this.retryPressed})
      : super(key: key);

  final Object error;
  final VoidCallback? retryPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: backgroundColor,
      child: Stack(
        children: [
          Opacity(
            opacity: 0.05,
            child: Center(
              child: Image.asset('assets/images/girl.png'),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'エラーが発生しました',
                    style: largeBlackTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ElevatedButton(
                    onPressed: () => retryPressed?.call(),
                    child: const SplaText('再読み込み'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
