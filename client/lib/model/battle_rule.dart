part of openapi.api;

class BattleRule {
  /* Localized rule name. */
  String name = null;
  /* Rule key. ref: https://splatoon2.ink/data/locale/ja.json */
  String key = null;
  //enum keyEnum {  turf_war,  splat_zones,  tower_control,  rainmaker,  clam_blitz,  };{
  BattleRule();

  @override
  String toString() {
    return 'BattleRule[name=$name, key=$key, ]';
  }

  BattleRule.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'key': key
    };
  }

  static List<BattleRule> listFromJson(List<dynamic> json) {
    return json == null ? new List<BattleRule>() : json.map((value) => new BattleRule.fromJson(value)).toList();
  }

  static Map<String, BattleRule> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, BattleRule>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new BattleRule.fromJson(value));
    }
    return map;
  }
}

