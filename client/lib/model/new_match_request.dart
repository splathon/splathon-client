part of openapi.api;

class NewMatchRequest {
  
  int alphaTeamId = null;
  
  int bravoTeamId = null;
  
  int roomId = null;
  /* Match order in this room. */
  int orderInRoom = null;
  NewMatchRequest();

  @override
  String toString() {
    return 'NewMatchRequest[alphaTeamId=$alphaTeamId, bravoTeamId=$bravoTeamId, roomId=$roomId, orderInRoom=$orderInRoom, ]';
  }

  NewMatchRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    alphaTeamId = json['alpha_team_id'];
    bravoTeamId = json['bravo_team_id'];
    roomId = json['room_id'];
    orderInRoom = json['order_in_room'];
  }

  Map<String, dynamic> toJson() {
    return {
      'alpha_team_id': alphaTeamId,
      'bravo_team_id': bravoTeamId,
      'room_id': roomId,
      'order_in_room': orderInRoom
    };
  }

  static List<NewMatchRequest> listFromJson(List<dynamic> json) {
    return json == null ? new List<NewMatchRequest>() : json.map((value) => new NewMatchRequest.fromJson(value)).toList();
  }

  static Map<String, NewMatchRequest> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, NewMatchRequest>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new NewMatchRequest.fromJson(value));
    }
    return map;
  }
}

