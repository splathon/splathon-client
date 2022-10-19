part of openapi.api;

class Rank {
  /* 順位 */
  int rank = null;
  
  Team team = null;
  /* 勝ち点 */
  int point = null;
  /* OMWP (Opponent Match Win Percentage) */
  num omwp = null;
  /* 何戦こなしたか。 */
  int numOfMatches = null;
  Rank();

  @override
  String toString() {
    return 'Rank[rank=$rank, team=$team, point=$point, omwp=$omwp, numOfMatches=$numOfMatches, ]';
  }

  Rank.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    rank = json['rank'];
    team = new Team.fromJson(json['team']);
    point = json['point'];
    omwp = json['omwp'];
    numOfMatches = json['num_of_matches'];
  }

  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'team': team,
      'point': point,
      'omwp': omwp,
      'num_of_matches': numOfMatches
    };
  }

  static List<Rank> listFromJson(List<dynamic> json) {
    return json == null ? new List<Rank>() : json.map((value) => new Rank.fromJson(value)).toList();
  }

  static Map<String, Rank> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Rank>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Rank.fromJson(value));
    }
    return map;
  }
}

