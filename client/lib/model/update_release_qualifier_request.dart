part of openapi.api;

class UpdateReleaseQualifierRequest {
  
  int round = null;
  UpdateReleaseQualifierRequest();

  @override
  String toString() {
    return 'UpdateReleaseQualifierRequest[round=$round, ]';
  }

  UpdateReleaseQualifierRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    round = json['round'];
  }

  Map<String, dynamic> toJson() {
    return {
      'round': round
    };
  }

  static List<UpdateReleaseQualifierRequest> listFromJson(List<dynamic> json) {
    return json == null ? new List<UpdateReleaseQualifierRequest>() : json.map((value) => new UpdateReleaseQualifierRequest.fromJson(value)).toList();
  }

  static Map<String, UpdateReleaseQualifierRequest> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, UpdateReleaseQualifierRequest>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new UpdateReleaseQualifierRequest.fromJson(value));
    }
    return map;
  }
}

