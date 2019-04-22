part of openapi.api;

class Member {
  /* Member ID (Slack ID かも?) */
  int id = null;
  
  String name = null;
  /* Slack icon URL */
  String icon = null;
  
  MemberDetail detail = null;
  Member();

  @override
  String toString() {
    return 'Member[id=$id, name=$name, icon=$icon, detail=$detail, ]';
  }

  Member.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    detail = new MemberDetail.fromJson(json['detail']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'detail': detail
    };
  }

  static List<Member> listFromJson(List<dynamic> json) {
    return json == null ? new List<Member>() : json.map((value) => new Member.fromJson(value)).toList();
  }

  static Map<String, Member> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Member>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Member.fromJson(value));
    }
    return map;
  }
}

