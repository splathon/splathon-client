part of openapi.api;

class Error {
  
  String message = null;
  
  int code = null;
  Error();

  @override
  String toString() {
    return 'Error[message=$message, code=$code, ]';
  }

  Error.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'code': code
    };
  }

  static List<Error> listFromJson(List<dynamic> json) {
    return json == null ? new List<Error>() : json.map((value) => new Error.fromJson(value)).toList();
  }

  static Map<String, Error> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Error>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Error.fromJson(value));
    }
    return map;
  }
}

