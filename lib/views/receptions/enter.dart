import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:splathon_app/domains/reception_provider.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text.dart';

class Enter extends HookConsumerWidget {
  const Enter({super.key, required this.isBuilding});
  final bool isBuilding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(receptionProvider);

    return result.when(
      data: (data) {
        ReceptionCode? reception = isBuilding ? data.building : data.splathon;
        if (reception == null) {
          return const CircularProgressIndicator();
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
      },
      error: (error, stackTrace) => const CircularProgressIndicator(),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
