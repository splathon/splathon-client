part of openapi.api;

class Rule {
  /* Rule key. ref: https://splatoon2.ink/data/locale/ja.json */
  String key = null;
  //enum keyEnum {  turf_war,  splat_zones,  tower_control,  rainmaker,  clam_blitz,  };{
  /* Localized rule name. */
  String name = null;
  Rule();

  @override
  String toString() {
    return 'Rule[key=$key, name=$name, ]';
  }

  Rule.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    key = json['key'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'name': name
    };
  }

  static List<Rule> listFromJson(List<dynamic> json) {
    return json == null ? new List<Rule>() : json.map((value) => new Rule.fromJson(value)).toList();
  }

  static Map<String, Rule> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Rule>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Rule.fromJson(value));
    }
    return map;
  }
}

