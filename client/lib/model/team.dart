part of openapi.api;

class Team {
  /* Team ID */
  int id = null;
  
  String name = null;
  /* Team の大会にむけての意気込みコメント */
  String shortComment = null;
  
  List<Member> members = [];
  Team();

  @override
  String toString() {
    return 'Team[id=$id, name=$name, shortComment=$shortComment, members=$members, ]';
  }

  Team.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    shortComment = json['short_comment'];
    members = Member.listFromJson(json['members']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'short_comment': shortComment,
      'members': members
    };
  }

  static List<Team> listFromJson(List<dynamic> json) {
    return json == null ? new List<Team>() : json.map((value) => new Team.fromJson(value)).toList();
  }

  static Map<String, Team> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Team>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Team.fromJson(value));
    }
    return map;
  }
}

