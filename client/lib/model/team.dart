part of openapi.api;

class Team {
  /* Team ID */
  int id = null;
  
  String name = null;
  
  List<Member> members = [];
  Team();

  @override
  String toString() {
    return 'Team[id=$id, name=$name, members=$members, ]';
  }

  Team.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    members = Member.listFromJson(json['members']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
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

