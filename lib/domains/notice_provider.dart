import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:splathon_app/domains/notification_view_model.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:splathon_app/utils/preference.dart';

final noticeProvider = FutureProvider.autoDispose<List<Notice>>((ref) async {
  var client = DefaultApi();
  String token = Preference().getToken();
  var result = await client.listNotices(Config.eventNumber, token);
  if (result == null) {
    throw Exception();
  }
  return result.notices;
});

final nextMatchProvider =
    FutureProvider.autoDispose.family<NextMatch?, int>((ref, teamId) async {
  var client = MatchApi();
  String token = Preference().getToken();
  var result =
      await client.getNextMatch(Config.eventNumber, token, teamId: teamId);
  if (result == null) {
    throw Exception();
  }
  return result.nextMatch;
});

final scheduleProvider =
    FutureProvider.autoDispose<List<ScheduleEntry>>((ref) async {
  var client = DefaultApi();
  var result = await client.getSchedule(Config.eventNumber);
  if (result == null) {
    throw Exception();
  }
  return result.entries;
});

final notificationStateProvider = StateNotifierProvider<
    NotificationStateNotifier, AsyncValue<NotificationViewModel>>((ref) {
  return NotificationStateNotifier(ref);
});

class NotificationStateNotifier
    extends StateNotifier<AsyncValue<NotificationViewModel>> {
  NotificationStateNotifier(this._ref) : super(const AsyncLoading()) {
    load();
  }
  final Ref _ref;

  void load() {
    int teamId = Preference().getTeamId();

    late List<Notice> notices;
    late List<ScheduleEntry> schedules;
    late NextMatch? nextMatch;

    final nextMatchTask =
        teamId > 0 ? _fetchNextMatch(teamId: teamId) : Future.sync(() => null);

    nextMatchTask.then((resNextMatch) {
      nextMatch = resNextMatch;
      return _fetchNotices();
    }).then((resNotices) {
      notices = resNotices;
      return _fetchSchedules();
    }).then((resSchedule) {
      schedules = resSchedule;
      state = AsyncData(NotificationViewModel(
        notices: notices,
        nextMatch: nextMatch,
        schedules: schedules,
      ));
    }).catchError((error, stackTrace) {
      state = AsyncError(error, stackTrace);
    });
  }

  Future<List<Notice>> _fetchNotices() async {
    var client = DefaultApi();
    String token = Preference().getToken();
    var result = await client.listNotices(Config.eventNumber, token);
    if (result == null) {
      throw Exception();
    }
    return result.notices;
  }

  Future<List<ScheduleEntry>> _fetchSchedules() async {
    var client = DefaultApi();
    var result = await client.getSchedule(Config.eventNumber);
    if (result == null) {
      throw Exception();
    }
    return result.entries;
  }

  Future<NextMatch?> _fetchNextMatch({required int teamId}) async {
    var client = MatchApi();
    String token = Preference().getToken();
    var result =
        await client.getNextMatch(Config.eventNumber, token, teamId: teamId);
    if (result == null) {
      throw Exception();
    }
    return result.nextMatch;
  }
}
