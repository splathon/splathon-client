import 'package:openapi/api.dart';

class NotificationViewModel {
  NotificationViewModel({
    required this.notices,
    required this.nextMatch,
    required this.schedules,
  });
  List<Notice> notices;
  NextMatch? nextMatch;
  List<ScheduleEntry> schedules;
}
