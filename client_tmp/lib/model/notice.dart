part of openapi.api;

class Notice {
  
  int id = null;
  
  String text = null;
  
  int timestampSec = null;
  Notice();

  @override
  String toString() {
    return 'Notice[id=$id, text=$text, timestampSec=$timestampSec, ]';
  }

  Notice.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    text = json['text'];
    timestampSec = json['timestamp_sec'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
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

