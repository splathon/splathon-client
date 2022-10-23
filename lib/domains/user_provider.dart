import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:splathon_app/utils/preference.dart';

class User {
  User({
    required this.token,
    required this.isAdmin,
    required this.teamId,
    required this.teamName,
  });
  String token;
  bool isAdmin;
  int? teamId;
  String? teamName;
}

final userStateProvider =
    StateNotifierProvider<UserStateNotifier, User?>((ref) {
  return UserStateNotifier();
});

class UserStateNotifier extends StateNotifier<User?> {
  UserStateNotifier() : super(null) {
    load();
  }

  void load() {
    final token = Preference().getToken();
    if (token.isEmpty) {
      state = null;
      return;
    }
    final isAdmin = Preference().isAdmin();
    final teamId = Preference().getTeamId();
    final teamName = Preference().getTeamName();
    state = User(
      token: token,
      isAdmin: isAdmin,
      teamId: teamId,
      teamName: teamName,
    );
  }

  Future<User> login({
    required String userId,
    required String password,
  }) async {
    var client = DefaultApi();
    LoginRequest loginRequest =
        LoginRequest(userId: userId, password: password);
    return client.login(Config.eventNumber, loginRequest).then((response) {
      if (response == null) {
        throw Exception();
      }
      _register(
        token: response.token,
        isAdmin: response.isAdmin,
        teamId: response.team?.id,
        teamName: response.team?.name,
      );
      return state!;
    });
  }

  void _register({
    required String token,
    required bool isAdmin,
    int? teamId,
    String? teamName,
  }) {
    Preference().setToken(token);
    Preference().setIsAdmin(isAdmin);

    if (teamId != null && teamName != null) {
      Preference().setTeamId(teamId);
      Preference().setTeamName(teamName);
    }

    state = User(
      token: token,
      isAdmin: isAdmin,
      teamId: teamId,
      teamName: teamName,
    );
  }
}
