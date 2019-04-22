part of openapi.api;

class ParticipantReception {
  /* ハンドルネーム。 e.g. みーくん */
  String nickname = null;
  /* カタカナのフルネーム。 e.g. ヤマダタロウ */
  String fullnameKana = null;
  /* 所属企業名 */
  String companyName = null;
  /* チーム名 */
  String teamName = null;
  /* チームID(一応) */
  int teamId = null;
  /* 合計参加費(円) */
  int participantFee = null;
  /* 懇親会に参加するか否か */
  bool joinParty = null;
  /* スタッフかどうか */
  bool isStaff = null;
  /* playerとして参加するかどうか。falseならスタッフか観戦 */
  bool isPlayer = null;
  /* Nintendo Switch doc を持ってきたか */
  bool hasSwitchDock = null;
  /* 同伴者がいるかどうか。いる場合は用スプレッドシート確認。 */
  bool hasCompanion = null;
  ParticipantReception();

  @override
  String toString() {
    return 'ParticipantReception[nickname=$nickname, fullnameKana=$fullnameKana, companyName=$companyName, teamName=$teamName, teamId=$teamId, participantFee=$participantFee, joinParty=$joinParty, isStaff=$isStaff, isPlayer=$isPlayer, hasSwitchDock=$hasSwitchDock, hasCompanion=$hasCompanion, ]';
  }

  ParticipantReception.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    nickname = json['nickname'];
    fullnameKana = json['fullname_kana'];
    companyName = json['company_name'];
    teamName = json['team_name'];
    teamId = json['team_id'];
    participantFee = json['participant_fee'];
    joinParty = json['join_party'];
    isStaff = json['is_staff'];
    isPlayer = json['is_player'];
    hasSwitchDock = json['has_switch_dock'];
    hasCompanion = json['has_companion'];
  }

  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname,
      'fullname_kana': fullnameKana,
      'company_name': companyName,
      'team_name': teamName,
      'team_id': teamId,
      'participant_fee': participantFee,
      'join_party': joinParty,
      'is_staff': isStaff,
      'is_player': isPlayer,
      'has_switch_dock': hasSwitchDock,
      'has_companion': hasCompanion
    };
  }

  static List<ParticipantReception> listFromJson(List<dynamic> json) {
    return json == null ? new List<ParticipantReception>() : json.map((value) => new ParticipantReception.fromJson(value)).toList();
  }

  static Map<String, ParticipantReception> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, ParticipantReception>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new ParticipantReception.fromJson(value));
    }
    return map;
  }
}

