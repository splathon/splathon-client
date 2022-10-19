part of openapi.api;

class ListNoticesResponse {
  /* List of notices ordered by reverse chronological order. */
  List<Notice> notices = [];
  ListNoticesResponse();

  @override
  String toString() {
    return 'ListNoticesResponse[notices=$notices, ]';
  }

  ListNoticesResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    notices = Notice.listFromJson(json['notices']);
  }

  Map<String, dynamic> toJson() {
    return {
      'notices': notices
    };
  }

  static List<ListNoticesResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<ListNoticesResponse>() : json.map((value) => new ListNoticesResponse.fromJson(value)).toList();
  }

  static Map<String, ListNoticesResponse> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, ListNoticesResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new ListNoticesResponse.fromJson(value));
    }
    return map;
  }
}

