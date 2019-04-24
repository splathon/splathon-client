part of openapi.api;

class Notice {
  
  String text = null;
  
  int timestampSec = null;
  Notice();

  @override
  String toString() {
    return 'Notice[text=$text, timestampSec=$timestampSec, ]';
  }

  Notice.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    text = json['text'];
    timestampSec = json['timestamp_sec'];
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'timestamp_sec': timestampSec
    };
  }

  static List<Notice> listFromJson(List<dynamic> json) {
    return json == null ? new List<Notice>() : json.map((value) => new Notice.fromJson(value)).toList();
  }

  static Map<String, Notice> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Notice>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Notice.fromJson(value));
    }
    return map;
  }
}

