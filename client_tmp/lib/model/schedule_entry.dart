part of openapi.api;

class ScheduleEntry {
  
  String title = null;
  /* Unix timestamp in seconds. */
  int startTimestampSec = null;
  
  int durationSec = null;
  ScheduleEntry();

  @override
  String toString() {
    return 'ScheduleEntry[title=$title, startTimestampSec=$startTimestampSec, durationSec=$durationSec, ]';
  }

  ScheduleEntry.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    title = json['title'];
    startTimestampSec = json['start_timestamp_sec'];
    durationSec = json['duration_sec'];
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'start_timestamp_sec': startTimestampSec,
      'duration_sec': durationSec
    };
  }

  static List<ScheduleEntry> listFromJson(List<dynamic> json) {
    return json == null ? new List<ScheduleEntry>() : json.map((value) => new ScheduleEntry.fromJson(value)).toList();
  }

  static Map<String, ScheduleEntry> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, ScheduleEntry>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new ScheduleEntry.fromJson(value));
    }
    return map;
  }
}

