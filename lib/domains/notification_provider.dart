import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:splathon_app/domains/notification_view_model.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:splathon_app/utils/preference.dart';

final noticeReadtimeProvider =
    StateNotifierProvider<NoticeReadtimeStateNotifier, int>((ref) {
  return NoticeReadtimeStateNotifier();
});

class NoticeReadtimeStateNotifier extends StateNotifier<int> {
  NoticeReadtimeStateNotifier() : super(0) {
    load();
  }

  void load() {
    final readtime = Preference.getNoticeReadTime();
    state = readtime;
  }

  void read({bool refreshState = false}) {
    final secounds = DateTime.now().millisecondsSinceEpoch;
    Preference.setNoticeReadTime(secounds);

    if (refreshState) {
      state = secounds;
    }
  }
}

final notificationStateProvider = StateNotifierProvider<
    NotificationStateNotifier, AsyncValue<NotificationViewModel>>((ref) {
  return NotificationStateNotifier();
});

class NotificationStateNotifier
    extends StateNotifier<AsyncValue<NotificationViewModel>> {
  NotificationStateNotifier() : super(const AsyncLoading()) {
    load();
  }
  void load() {
    int? teamId = Preference.getTeamId();

    late List<Notice> notices;
    late List<ScheduleEntry> schedules;
    late NextMatch? nextMatch;

    final nextMatchTask = teamId != null
        ? _fetchNextMatch(teamId: teamId)
        : Future.sync(() => null);

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
    String token = Preference.getToken();
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
    String token = Preference.getToken();
    var result =
        await client.getNextMatch(Config.eventNumber, token, teamId: teamId);
    if (result == null) {
      throw Exception();
    }
    return result.nextMatch;
  }
}
