part of openapi.api;

class LoginRequest {
  /* Slack username (https://splathon.slack.com/account/settings#username) */
  String userId = null;
  
  String password = null;
  LoginRequest();

  @override
  String toString() {
    return 'LoginRequest[userId=$userId, password=$password, ]';
  }

  LoginRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    userId = json['user_id'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'password': password
    };
  }

  static List<LoginRequest> listFromJson(List<dynamic> json) {
    return json == null ? new List<LoginRequest>() : json.map((value) => new LoginRequest.fromJson(value)).toList();
  }

  static Map<String, LoginRequest> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, LoginRequest>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new LoginRequest.fromJson(value));
    }
    return map;
  }
}

