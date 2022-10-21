import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:splathon_app/utils/preference.dart';

final resultsProvider = FutureProvider.autoDispose<Results>((ref) async {
  var client = ResultApi();
  String token = Preference().getToken();
  var result =
      await client.getResult(Config.eventNumber, X_SPLATHON_API_TOKEN: token);
  if (result == null) {
    throw Exception();
  }
  return result;
});

final selectTeamProvider = StateProvider<Team>((ref) => Team(id: 0, name: ''));

final resultProvider =
    StateNotifierProvider<SelectTeamResultStateNotifier, AsyncValue<Results>>(
        (ref) {
  return SelectTeamResultStateNotifier(ref);
});

class SelectTeamResultStateNotifier extends StateNotifier<AsyncValue<Results>> {
  SelectTeamResultStateNotifier(this._ref) : super(const AsyncLoading()) {
    load();
  }
  final Ref _ref;
  late List<Team> teams;

  void load() async {
    final teamId = Preference().getTeamId();
    _fetchTeams().then((resTeams) {
      teams = resTeams;
      final preSelectTeam =
          teamId > 0 ? teams.firstWhere((e) => e.id == teamId) : teams.first;
      _ref.read(selectTeamProvider.notifier).update((_) => preSelectTeam);
      return _fetchResult(teamId: preSelectTeam.id);
    }).then((result) {
      state = AsyncData(result);
    }).catchError((error, stackTrace) {
      throw error;
    });
  }

  Future<List<Team>> _fetchTeams() async {
    var client = DefaultApi();
    var result = await client.listTeams(Config.eventNumber);
    if (result == null) {
      throw Exception();
    }
    return result.teams;
  }

  Future<Results> _fetchResult({required int teamId}) async {
    var client = ResultApi();
    String token = Preference().getToken();
    var result = await client.getResult(Config.eventNumber,
        X_SPLATHON_API_TOKEN: token, teamId: teamId);
    if (result == null) {
      throw Exception();
    }
    return result;
  }

  void select(String teamName) {
    final team = teams.firstWhere((e) => e.name == teamName);
    _ref.read(selectTeamProvider.notifier).update((_) => team);
    _fetchResult(teamId: team.id).then((result) {
      state = AsyncData(result);
    }).catchError((error, stackTrace) {
      throw error;
    });
  }
}
