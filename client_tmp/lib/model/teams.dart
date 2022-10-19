part of openapi.api;

class Teams {
  
  List<Team> teams = [];
  Teams();

  @override
  String toString() {
    return 'Teams[teams=$teams, ]';
  }

  Teams.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    teams = Team.listFromJson(json['teams']);
  }

  Map<String, dynamic> toJson() {
    return {
      'teams': teams
    };
  }

  static List<Teams> listFromJson(List<dynamic> json) {
    return json == null ? new List<Teams>() : json.map((value) => new Teams.fromJson(value)).toList();
  }

  static Map<String, Teams> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Teams>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Teams.fromJson(value));
    }
    return map;
  }
}

