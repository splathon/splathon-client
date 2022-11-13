import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:splathon_app/utils/config.dart';

final matchProvider =
    FutureProvider.autoDispose.family<Match, int>((ref, matchId) async {
  var client = MatchApi();
  var result = await client.getMatch(Config.apiEventNumber, matchId);
  if (result == null) {
    throw Exception();
  }
  return result;
});
