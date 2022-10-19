part of openapi.api;

class LoginResponse {
  /* Session API token. Send this token via X-SPLATHON-API-TOKEN HTTP hader. 'X-SPLATHON-API-TOKEN: <token>' */
  String token = null;
  /* 管理者かどうか。(e.g. true なら battle data を送信できる。) */
  bool isAdmin = null;
  
  Team team = null;
  LoginResponse();

  @override
  String toString() {
    return 'LoginResponse[token=$token, isAdmin=$isAdmin, team=$team, ]';
  }

  LoginResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    token = json['token'];
    isAdmin = json['is_admin'];
    team = new Team.fromJson(json['team']);
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'is_admin': isAdmin,
      'team': team
    };
  }

  static List<LoginResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<LoginResponse>() : json.map((value) => new LoginResponse.fromJson(value)).toList();
  }

  static Map<String, LoginResponse> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, LoginResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new LoginResponse.fromJson(value));
    }
    return map;
  }
}

