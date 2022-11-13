import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart' as API;

class ReportViewModel {
  ReportViewModel({required this.match, required this.battle});
  API.Match match;
  API.Battle battle;
}

final reportProvider =
    StateNotifierProvider.autoDispose<ReportStateNotifier, ReportViewModel?>(
        (ref) => ReportStateNotifier(ref));

class ReportStateNotifier extends StateNotifier<ReportViewModel?> {
  ReportStateNotifier(this.ref) : super(null);

  Ref ref;

  void setInitialModel(ReportViewModel model) {
    state = model;
  }

  void update(
      {String? rule, String? stage, String? winner, required API.Event event}) {
    if (rule != null) {
      final selectRule = event.rules.firstWhereOrNull((e) => e.name == rule);
      if (selectRule == null) return;

      state?.battle.rule = selectRule;
    }
    if (stage != null) {
      final selectStage = event.stages.firstWhereOrNull((e) => e.name == stage);
      if (selectStage == null) return;

      state?.battle.stage = selectStage;
    }
    if (winner != null) {
      if (winner == API.BattleWinnerEnum.alpha.value) {
        state?.battle.winner = API.BattleWinnerEnum.alpha;
      } else {
        state?.battle.winner = API.BattleWinnerEnum.bravo;
      }
    }
  }
}
