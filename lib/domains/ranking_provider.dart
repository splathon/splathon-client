import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:splathon_app/utils/config.dart';

final rankingProvider = FutureProvider<Ranking>((ref) async {
  var client = RankingApi();
  var result = await client.getRanking(Config.apiEventNumber);
  if (result == null) {
    throw Exception();
  }
  return result;
});
