import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:splathon_app/utils/config.dart';

final eventProvider = FutureProvider.autoDispose<Event>((ref) async {
  var client = DefaultApi();
  var result = await client.getEvent(Config.apiEventNumber);
  if (result == null) {
    throw Exception();
  }
  return result;
});
