part of openapi.api;

class Room {
  /* Room ID. */
  int id = null;
  
  String name = null;
  
  List<Match> matches = [];
  Room();

  @override
  String toString() {
    return 'Room[id=$id, name=$name, matches=$matches, ]';
  }

  Room.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    matches = Match.listFromJson(json['matches']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'matches': matches
    };
  }

  static List<Room> listFromJson(List<dynamic> json) {
    return json == null ? new List<Room>() : json.map((value) => new Room.fromJson(value)).toList();
  }

  static Map<String, Room> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Room>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Room.fromJson(value));
    }
    return map;
  }
}

