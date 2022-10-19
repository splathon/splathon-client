part of openapi.api;

class ReceptionResponse {
  
  ReceptionCode building = null;
  
  ReceptionCode splathon = null;
  ReceptionResponse();

  @override
  String toString() {
    return 'ReceptionResponse[building=$building, splathon=$splathon, ]';
  }

  ReceptionResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    building = new ReceptionCode.fromJson(json['building']);
    splathon = new ReceptionCode.fromJson(json['splathon']);
  }

  Map<String, dynamic> toJson() {
    return {
      'building': building,
      'splathon': splathon
    };
  }

  static List<ReceptionResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<ReceptionResponse>() : json.map((value) => new ReceptionResponse.fromJson(value)).toList();
  }

  static Map<String, ReceptionResponse> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, ReceptionResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new ReceptionResponse.fromJson(value));
    }
    return map;
  }
}

