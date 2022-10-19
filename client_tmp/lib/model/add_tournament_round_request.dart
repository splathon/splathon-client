part of openapi.api;

class AddTournamentRoundRequest {
  
  String roundName = null;
  
  int round = null;
  
  List<NewMatchRequest> matches = [];
  AddTournamentRoundRequest();

  @override
  String toString() {
    return 'AddTournamentRoundRequest[roundName=$roundName, round=$round, matches=$matches, ]';
  }

  AddTournamentRoundRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    roundName = json['round_name'];
    round = json['round'];
    matches = NewMatchRequest.listFromJson(json['matches']);
  }

  Map<String, dynamic> toJson() {
    return {
      'round_name': roundName,
      'round': round,
      'matches': matches
    };
  }

  static List<AddTournamentRoundRequest> listFromJson(List<dynamic> json) {
    return json == null ? new List<AddTournamentRoundRequest>() : json.map((value) => new AddTournamentRoundRequest.fromJson(value)).toList();
  }

  static Map<String, AddTournamentRoundRequest> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, AddTournamentRoundRequest>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new AddTournamentRoundRequest.fromJson(value));
    }
    return map;
  }
}

