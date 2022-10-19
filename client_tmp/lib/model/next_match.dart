part of openapi.api;

class NextMatch {
  
  Team ownTeam = null;
  
  Team opponentTeam = null;
  /* ラウンド名。e.g. 予選第1ラウンド, 決勝T1回戦, 決勝戦. */
  String roundName = null;
  
  NextMatchRoom room = null;
  /* Room内でのマッチの順番 */
  int matchOrderInRoom = null;
  
  Match matchDetail = null;
  NextMatch();

  @override
  String toString() {
    return 'NextMatch[ownTeam=$ownTeam, opponentTeam=$opponentTeam, roundName=$roundName, room=$room, matchOrderInRoom=$matchOrderInRoom, matchDetail=$matchDetail, ]';
  }

  NextMatch.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    ownTeam = new Team.fromJson(json['own_team']);
    opponentTeam = new Team.fromJson(json['opponent_team']);
    roundName = json['round_name'];
    room = new NextMatchRoom.fromJson(json['room']);
    matchOrderInRoom = json['match_order_in_room'];
    matchDetail = new Match.fromJson(json['match_detail']);
  }

  Map<String, dynamic> toJson() {
    return {
      'own_team': ownTeam,
      'opponent_team': opponentTeam,
      'round_name': roundName,
      'room': room,
      'match_order_in_room': matchOrderInRoom,
      'match_detail': matchDetail
    };
  }

  static List<NextMatch> listFromJson(List<dynamic> json) {
    return json == null ? new List<NextMatch>() : json.map((value) => new NextMatch.fromJson(value)).toList();
  }

  static Map<String, NextMatch> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, NextMatch>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new NextMatch.fromJson(value));
    }
    return map;
  }
}

