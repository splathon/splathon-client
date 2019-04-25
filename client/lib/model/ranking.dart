part of openapi.api;

class Ranking {
  /* ランキング計算時点の説明。e.g. 予選第2ラウンド終了時 */
  String rankTime = null;
  
  List<Rank> rankings = [];
  Ranking();

  @override
  String toString() {
    return 'Ranking[rankTime=$rankTime, rankings=$rankings, ]';
  }

  Ranking.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    rankTime = json['rank_time'];
    rankings = Rank.listFromJson(json['rankings']);
  }

  Map<String, dynamic> toJson() {
    return {
      'rank_time': rankTime,
      'rankings': rankings
    };
  }

  static List<Ranking> listFromJson(List<dynamic> json) {
    return json == null ? new List<Ranking>() : json.map((value) => new Ranking.fromJson(value)).toList();
  }

  static Map<String, Ranking> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Ranking>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Ranking.fromJson(value));
    }
    return map;
  }
}

