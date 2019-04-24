part of openapi.api;

class GetNextMatchResponse {
  
  NextMatch nextMatch = null;
  GetNextMatchResponse();

  @override
  String toString() {
    return 'GetNextMatchResponse[nextMatch=$nextMatch, ]';
  }

  GetNextMatchResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    nextMatch = new NextMatch.fromJson(json['next_match']);
  }

  Map<String, dynamic> toJson() {
    return {
      'next_match': nextMatch
    };
  }

  static List<GetNextMatchResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<GetNextMatchResponse>() : json.map((value) => new GetNextMatchResponse.fromJson(value)).toList();
  }

  static Map<String, GetNextMatchResponse> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, GetNextMatchResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new GetNextMatchResponse.fromJson(value));
    }
    return map;
  }
}

