part of openapi.api;

class ReceptionPartcipantsDataResponse {
  /* 受付の仕方の説明や注意点などのフリーテキスト。 */
  String description = null;
  /* 参加者の Slack Internal ID */
  String slackInternalId = null;
  /* 1つのSlackIDで複数の参加者をカバーしている。また participants とは別に参加者情報のない同伴者が存在する可能性があり、 もしいる場合は has_companion flag が true となる */
  List<ParticipantReception> participants = [];
  ReceptionPartcipantsDataResponse();

  @override
  String toString() {
    return 'ReceptionPartcipantsDataResponse[description=$description, slackInternalId=$slackInternalId, participants=$participants, ]';
  }

  ReceptionPartcipantsDataResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    description = json['description'];
    slackInternalId = json['slack_internal_id'];
    participants = ParticipantReception.listFromJson(json['participants']);
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'slack_internal_id': slackInternalId,
      'participants': participants
    };
  }

  static List<ReceptionPartcipantsDataResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<ReceptionPartcipantsDataResponse>() : json.map((value) => new ReceptionPartcipantsDataResponse.fromJson(value)).toList();
  }

  static Map<String, ReceptionPartcipantsDataResponse> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, ReceptionPartcipantsDataResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new ReceptionPartcipantsDataResponse.fromJson(value));
    }
    return map;
  }
}

