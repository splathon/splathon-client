import 'dart:async';

import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:splathon_app/utils/preference.dart';

final resultsProvider = FutureProvider<Results>((ref) async {
  var client = ResultApi();
  String token = Preference.getToken();
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
  SelectTeamResultStateNotifier(this.ref) : super(const AsyncLoading()) {
    load();
  }
  final Ref ref;
  late List<Team> teams;

  void load() async {
    final teamId = Preference.getTeamId();
    _fetchTeams().then((resTeams) {
      teams = resTeams;
      final preSelectTeam = teamId != null
          ? teams.firstWhere((e) => e.id == teamId)
          : teams.first;
      ref.read(selectTeamProvider.notifier).update((_) => preSelectTeam);
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
    String token = Preference.getToken();
    var result = await client.getResult(Config.eventNumber,
        X_SPLATHON_API_TOKEN: token, teamId: teamId);
    if (result == null) {
      throw Exception();
    }
    return result;
  }

  void select(String teamName) {
    final team = teams.firstWhere((e) => e.name == teamName);
    ref.read(selectTeamProvider.notifier).update((_) => team);
    _fetchResult(teamId: team.id).then((result) {
      state = AsyncData(result);
    }).catchError((error, stackTrace) {
      throw error;
    });
  }
}

class ExpandParams {
  ExpandParams({
    required this.roundName,
    this.roomName,
  });
  String roundName;
  String? roomName;
}

class ExpandResultModel {
  ExpandResultModel({
    required this.roundName,
    required this.roomName,
    required this.isExpanded,
  });
  String roundName;
  String? roomName;
  bool isExpanded;
}

final expandResultProvider = Provider.family<bool, ExpandParams>(
  (ref, params) =>
      ref
          .watch(expandsResultProvider)
          .firstWhereOrNull((element) =>
              element.roundName == params.roundName &&
              element.roomName == params.roomName)
          ?.isExpanded ??
      false,
);

final StateNotifierProvider<ExpandResultStateNotifier, Set<ExpandResultModel>>
    expandsResultProvider =
    StateNotifierProvider<ExpandResultStateNotifier, Set<ExpandResultModel>>(
        (ref) {
  return ExpandResultStateNotifier(ref);
});

class ExpandResultStateNotifier extends StateNotifier<Set<ExpandResultModel>> {
  ExpandResultStateNotifier(this.ref) : super({}) {
    load();
  }
  final Ref ref;
  late List<Team> teams;

  void load() async {}

  void changed(
      {required String roundName, String? roomName, required bool isExpanded}) {
    final currentState = state;
    currentState.removeWhere((element) =>
        element.roundName == roundName && element.roomName == roomName);
    state = {
      ...currentState,
      ExpandResultModel(
          roundName: roundName, roomName: roomName, isExpanded: isExpanded)
    };
  }

  bool isExpanded({required String roundName, String? roomName}) {
    final expandResult = state.firstWhereOrNull((element) =>
        element.roundName == roundName && element.roomName == roomName);
    return expandResult?.isExpanded ?? false;
  }
}
