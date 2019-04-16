part of openapi.api;

class Battle {
  /* Battle ID */
  int id = null;
  /* 勝者がどちらか。 */
  String winner = null;
  //enum winnerEnum {  alpha,  bravo,  };{
  /* 何戦目か */
  int order = null;
  
  BattleRule rule = null;
  
  BattleStage stage = null;
  Battle();

  @override
  String toString() {
    return 'Battle[id=$id, winner=$winner, order=$order, rule=$rule, stage=$stage, ]';
  }

  Battle.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    winner = json['winner'];
    order = json['order'];
    rule = new BattleRule.fromJson(json['rule']);
    stage = new BattleStage.fromJson(json['stage']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'winner': winner,
      'order': order,
      'rule': rule,
      'stage': stage
    };
  }

  static List<Battle> listFromJson(List<dynamic> json) {
    return json == null ? new List<Battle>() : json.map((value) => new Battle.fromJson(value)).toList();
  }

  static Map<String, Battle> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Battle>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Battle.fromJson(value));
    }
    return map;
  }
}

