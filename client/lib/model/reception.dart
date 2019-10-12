part of openapi.api;

class Reception {
  
  int id = null;
  
  int participantId = null;
  
  int createdAtTimestampSec = null;
  
  int updatedAtTimestampSec = null;
  
  String memo = null;
  Reception();

  @override
  String toString() {
    return 'Reception[id=$id, participantId=$participantId, createdAtTimestampSec=$createdAtTimestampSec, updatedAtTimestampSec=$updatedAtTimestampSec, memo=$memo, ]';
  }

  Reception.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    participantId = json['participant_id'];
    createdAtTimestampSec = json['created_at_timestamp_sec'];
    updatedAtTimestampSec = json['updated_at_timestamp_sec'];
    memo = json['memo'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'participant_id': participantId,
      'created_at_timestamp_sec': createdAtTimestampSec,
      'updated_at_timestamp_sec': updatedAtTimestampSec,
      'memo': memo
    };
  }

  static List<Reception> listFromJson(List<dynamic> json) {
    return json == null ? new List<Reception>() : json.map((value) => new Reception.fromJson(value)).toList();
  }

  static Map<String, Reception> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Reception>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Reception.fromJson(value));
    }
    return map;
  }
}

