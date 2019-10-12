part of openapi.api;

class ListReceptionResponse {
  
  List<ParticipantReception> participants = [];
  ListReceptionResponse();

  @override
  String toString() {
    return 'ListReceptionResponse[participants=$participants, ]';
  }

  ListReceptionResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    participants = ParticipantReception.listFromJson(json['participants']);
  }

  Map<String, dynamic> toJson() {
    return {
      'participants': participants
    };
  }

  static List<ListReceptionResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<ListReceptionResponse>() : json.map((value) => new ListReceptionResponse.fromJson(value)).toList();
  }

  static Map<String, ListReceptionResponse> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, ListReceptionResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new ListReceptionResponse.fromJson(value));
    }
    return map;
  }
}

