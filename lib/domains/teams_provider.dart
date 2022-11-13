import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:splathon_app/utils/config.dart';

final teamsProvider = FutureProvider<List<Team>>((ref) async {
  var client = DefaultApi();
  var result = await client.listTeams(Config.apiEventNumber);
  if (result == null) {
    throw Exception();
  }
  return result.teams;
});
