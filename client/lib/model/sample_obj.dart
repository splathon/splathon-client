part of openapi.api;

class SampleObj {
  
  int id = null;
  
  String username = null;
  SampleObj();

  @override
  String toString() {
    return 'SampleObj[id=$id, username=$username, ]';
  }

  SampleObj.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username
    };
  }

  static List<SampleObj> listFromJson(List<dynamic> json) {
    return json == null ? new List<SampleObj>() : json.map((value) => new SampleObj.fromJson(value)).toList();
  }

  static Map<String, SampleObj> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SampleObj>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SampleObj.fromJson(value));
    }
    return map;
  }
}

