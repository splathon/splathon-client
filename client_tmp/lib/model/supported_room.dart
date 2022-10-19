part of openapi.api;

class SupportedRoom {
  /* Room ID. */
  int id = null;
  /* Room name. e.g. A卓 */
  String name = null;
  
  int priority = null;
  SupportedRoom();

  @override
  String toString() {
    return 'SupportedRoom[id=$id, name=$name, priority=$priority, ]';
  }

  SupportedRoom.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    priority = json['priority'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'priority': priority
    };
  }

  static List<SupportedRoom> listFromJson(List<dynamic> json) {
    return json == null ? new List<SupportedRoom>() : json.map((value) => new SupportedRoom.fromJson(value)).toList();
  }

  static Map<String, SupportedRoom> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SupportedRoom>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SupportedRoom.fromJson(value));
    }
    return map;
  }
}

