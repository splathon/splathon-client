part of openapi.api;

class Stage {
  /* Stage ID. ref: https://splatoon2.ink/data/locale/ja.json */
  int id = null;
  /* Localized stage name. */
  String name = null;
  Stage();

  @override
  String toString() {
    return 'Stage[id=$id, name=$name, ]';
  }

  Stage.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name
    };
  }

  static List<Stage> listFromJson(List<dynamic> json) {
    return json == null ? new List<Stage>() : json.map((value) => new Stage.fromJson(value)).toList();
  }

  static Map<String, Stage> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Stage>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Stage.fromJson(value));
    }
    return map;
  }
}

