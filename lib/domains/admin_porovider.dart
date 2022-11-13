import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart' as API;
import 'package:splathon_app/domains/report_provider.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:splathon_app/utils/preference.dart';

final adminProvider =
    StateNotifierProvider.autoDispose<AdminStateNotifier, void>(
        (ref) => AdminStateNotifier());

class AdminStateNotifier extends StateNotifier<void> {
  AdminStateNotifier() : super(null);

  Future<void> report(ReportViewModel viewModel) async {
    var client = API.AdminApi();
    String token = Preference.getToken();
    return await client.updateBattle(
        Config.apiEventNumber, viewModel.match.id, token, viewModel.battle);
  }
}
