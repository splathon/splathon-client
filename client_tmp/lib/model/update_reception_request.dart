part of openapi.api;

class UpdateReceptionRequest {
  
  ParticipantReception participant = null;
  
  bool complete = null;
  UpdateReceptionRequest();

  @override
  String toString() {
    return 'UpdateReceptionRequest[participant=$participant, complete=$complete, ]';
  }

  UpdateReceptionRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    participant = new ParticipantReception.fromJson(json['participant']);
    complete = json['complete'];
  }

  Map<String, dynamic> toJson() {
    return {
      'participant': participant,
      'complete': complete
    };
  }

  static List<UpdateReceptionRequest> listFromJson(List<dynamic> json) {
    return json == null ? new List<UpdateReceptionRequest>() : json.map((value) => new UpdateReceptionRequest.fromJson(value)).toList();
  }

  static Map<String, UpdateReceptionRequest> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, UpdateReceptionRequest>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new UpdateReceptionRequest.fromJson(value));
    }
    return map;
  }
}

