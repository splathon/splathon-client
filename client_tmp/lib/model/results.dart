part of openapi.api;

class Results {
  
  List<Round> qualifiers = [];
  
  List<Round> tournament = [];
  Results();

  @override
  String toString() {
    return 'Results[qualifiers=$qualifiers, tournament=$tournament, ]';
  }

  Results.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    qualifiers = Round.listFromJson(json['qualifiers']);
    tournament = Round.listFromJson(json['tournament']);
  }

  Map<String, dynamic> toJson() {
    return {
      'qualifiers': qualifiers,
      'tournament': tournament
    };
  }

  static List<Results> listFromJson(List<dynamic> json) {
    return json == null ? new List<Results>() : json.map((value) => new Results.fromJson(value)).toList();
  }

  static Map<String, Results> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Results>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Results.fromJson(value));
    }
    return map;
  }
}

