part of openapi.api;

class NextMatchRoom {
  /* Room name. e.g. A卓 */
  String name = null;
  /* Room ID. */
  int id = null;
  NextMatchRoom();

  @override
  String toString() {
    return 'NextMatchRoom[name=$name, id=$id, ]';
  }

  NextMatchRoom.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id
    };
  }

  static List<NextMatchRoom> listFromJson(List<dynamic> json) {
    return json == null ? new List<NextMatchRoom>() : json.map((value) => new NextMatchRoom.fromJson(value)).toList();
  }

  static Map<String, NextMatchRoom> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, NextMatchRoom>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new NextMatchRoom.fromJson(value));
    }
    return map;
  }
}

