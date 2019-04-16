part of openapi.api;

class Match2 {
  /* Match ID */
  int id = null;
  /* 勝者がどちらか。または引き分け。 */
  String winner = null;
  //enum winnerEnum {  alpha,  bravo,  draw,  };{
  /* Room内でのマッチの順番 */
  int order = null;
  
  Team teamAlpha = null;
  
  Team teamBravo = null;
  
  List<Battle> battles = [];
  Match2();

  @override
  String toString() {
    return 'Match2[id=$id, winner=$winner, order=$order, teamAlpha=$teamAlpha, teamBravo=$teamBravo, battles=$battles, ]';
  }

  Match2.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    winner = json['winner'];
    order = json['order'];
    teamAlpha = new Team.fromJson(json['teamAlpha']);
    teamBravo = new Team.fromJson(json['teamBravo']);
    battles = Battle.listFromJson(json['battles']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'winner': winner,
      'order': order,
      'teamAlpha': teamAlpha,
      'teamBravo': teamBravo,
      'battles': battles
    };
  }

  static List<Match2> listFromJson(List<dynamic> json) {
    return json == null ? new List<Match2>() : json.map((value) => new Match2.fromJson(value)).toList();
  }

  static Map<String, Match2> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Match2>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Match2.fromJson(value));
    }
    return map;
  }
}

