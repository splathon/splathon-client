part of openapi.api;

class Ranking {
  
  List<Rank> rankings = [];
  Ranking();

  @override
  String toString() {
    return 'Ranking[rankings=$rankings, ]';
  }

  Ranking.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    rankings = Rank.listFromJson(json['rankings']);
  }

  Map<String, dynamic> toJson() {
    return {
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

