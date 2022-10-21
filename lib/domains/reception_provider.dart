import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:splathon_app/utils/preference.dart';

final receptionProvider =
    FutureProvider.autoDispose<ReceptionResponse>((ref) async {
  var client = ReceptionApi();
  String token = Preference().getToken();
  var result = await client.getReception(Config.eventNumber, token);
  if (result == null) {
    throw Exception();
  }
  return result;
});
