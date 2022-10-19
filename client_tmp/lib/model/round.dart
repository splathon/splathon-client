part of openapi.api;

class Round {
  /* Round ID. (Qualifier ID or Tournament ID) */
  int id = null;
  /* ラウンド名。e.g. 予選第1ラウンド, 決勝T1回戦, 決勝戦 */
  String name = null;
  /* 何ラウンドか。i.e. 予選第Nラウンド, 決勝T N回戦 */
  int round = null;
  
  List<Room> rooms = [];
  Round();

  @override
  String toString() {
    return 'Round[id=$id, name=$name, round=$round, rooms=$rooms, ]';
  }

  Round.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    round = json['round'];
    rooms = Room.listFromJson(json['rooms']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'round': round,
      'rooms': rooms
    };
  }

  static List<Round> listFromJson(List<dynamic> json) {
    return json == null ? new List<Round>() : json.map((value) => new Round.fromJson(value)).toList();
  }

  static Map<String, Round> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Round>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Round.fromJson(value));
    }
    return map;
  }
}

