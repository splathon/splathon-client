part of openapi.api;

class BattleStage {
  /* Localized stage name. */
  String name = null;
  /* Stage ID. ref: https://splatoon2.ink/data/locale/ja.json */
  int id = null;
  BattleStage();

  @override
  String toString() {
    return 'BattleStage[name=$name, id=$id, ]';
  }

  BattleStage.fromJson(Map<String, dynamic> json) {
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

  static List<BattleStage> listFromJson(List<dynamic> json) {
    return json == null ? new List<BattleStage>() : json.map((value) => new BattleStage.fromJson(value)).toList();
  }

  static Map<String, BattleStage> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, BattleStage>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new BattleStage.fromJson(value));
    }
    return map;
  }
}

