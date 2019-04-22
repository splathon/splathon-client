part of openapi.api;

class Match {
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
  /* ラウンド名。e.g. 予選第1ラウンド, 決勝T1回戦, 決勝戦. Match APIから読んだときに埋まっている */
  String roundName = null;
  Match();

  @override
  String toString() {
    return 'Match[id=$id, winner=$winner, order=$order, teamAlpha=$teamAlpha, teamBravo=$teamBravo, battles=$battles, roundName=$roundName, ]';
  }

  Match.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    winner = json['winner'];
    order = json['order'];
    teamAlpha = new Team.fromJson(json['teamAlpha']);
    teamBravo = new Team.fromJson(json['teamBravo']);
    battles = Battle.listFromJson(json['battles']);
    roundName = json['round_name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'winner': winner,
      'order': order,
      'teamAlpha': teamAlpha,
      'teamBravo': teamBravo,
      'battles': battles,
      'round_name': roundName
    };
  }

  static List<Match> listFromJson(List<dynamic> json) {
    return json == null ? new List<Match>() : json.map((value) => new Match.fromJson(value)).toList();
  }

  static Map<String, Match> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Match>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Match.fromJson(value));
    }
    return map;
  }
}

