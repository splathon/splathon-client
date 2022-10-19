part of openapi.api;

class Schedule {
  
  List<ScheduleEntry> entries = [];
  Schedule();

  @override
  String toString() {
    return 'Schedule[entries=$entries, ]';
  }

  Schedule.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    entries = ScheduleEntry.listFromJson(json['entries']);
  }

  Map<String, dynamic> toJson() {
    return {
      'entries': entries
    };
  }

  static List<Schedule> listFromJson(List<dynamic> json) {
    return json == null ? new List<Schedule>() : json.map((value) => new Schedule.fromJson(value)).toList();
  }

  static Map<String, Schedule> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Schedule>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Schedule.fromJson(value));
    }
    return map;
  }
}

