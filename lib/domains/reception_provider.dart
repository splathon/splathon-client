import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:splathon_app/utils/preference.dart';

final receptionProvider =
    FutureProvider.autoDispose<ReceptionResponse>((ref) async {
  var client = ReceptionApi();
  String token = Preference.getToken();
  var result = await client.getReception(Config.eventNumber, token);
  if (result == null) {
    throw Exception();
  }
  return result;
});

enum ReceptionState {
  ready,
  proceed;
}

final receptionStateProvider =
    StateNotifierProvider<ReceptionStateNotifier, ReceptionState>((ref) {
  return ReceptionStateNotifier(ref);
});

class ReceptionStateNotifier extends StateNotifier<ReceptionState> {
  ReceptionStateNotifier(this.ref) : super(ReceptionState.ready);

  final Ref ref;
  late String qrCode;

  Future<ReceptionPartcipantsDataResponse> recept(
      {required String code}) async {
    state = ReceptionState.proceed;
    var client = ReceptionApi();
    String token = Preference.getToken();
    var result = await client
        .getParticipantsDataForReception(Config.eventNumber, code, token)
        .catchError((error, stackTrace) {
      state = ReceptionState.ready;
    });
    if (result == null) {
      state = ReceptionState.ready;
      throw Exception();
    }
    qrCode = code;
    return result;
  }

  Future<void> completeReception() async {
    var client = ReceptionApi();
    String token = Preference.getToken();
    return await client.completeReception(Config.eventNumber, qrCode, token);
  }

  void cancel() {
    state = ReceptionState.ready;
  }

  void finish() {
    state = ReceptionState.ready;
  }
}
