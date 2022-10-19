//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ParticipantReception {
  /// Returns a new [ParticipantReception] instance.
  ParticipantReception({
    required this.id,
    required this.slackUserId,
    required this.nickname,
    required this.fullnameKana,
    required this.companyName,
    this.teamName,
    this.teamId,
    required this.participantFee,
    required this.joinParty,
    required this.isStaff,
    required this.isPlayer,
    required this.hasSwitchDock,
    required this.hasCompanion,
    this.reception,
  });

  /// internal id
  int id;

  /// Slack ID
  String slackUserId;

  /// ハンドルネーム。 e.g. みーくん
  String nickname;

  /// カタカナのフルネーム。 e.g. ヤマダタロウ
  String fullnameKana;

  /// 所属企業名
  String companyName;

  /// チーム名
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? teamName;

  /// チームID(一応)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? teamId;

  /// 合計参加費(円)
  int participantFee;

  /// 懇親会に参加するか否か
  bool joinParty;

  /// スタッフかどうか
  bool isStaff;

  /// playerとして参加するかどうか。falseならスタッフか観戦
  bool isPlayer;

  /// Nintendo Switch doc を持ってきたか
  bool hasSwitchDock;

  /// 同伴者がいるかどうか。いる場合は用スプレッドシート確認。
  bool hasCompanion;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Reception? reception;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ParticipantReception &&
     other.id == id &&
     other.slackUserId == slackUserId &&
     other.nickname == nickname &&
     other.fullnameKana == fullnameKana &&
     other.companyName == companyName &&
     other.teamName == teamName &&
     other.teamId == teamId &&
     other.participantFee == participantFee &&
     other.joinParty == joinParty &&
     other.isStaff == isStaff &&
     other.isPlayer == isPlayer &&
     other.hasSwitchDock == hasSwitchDock &&
     other.hasCompanion == hasCompanion &&
     other.reception == reception;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (slackUserId.hashCode) +
    (nickname.hashCode) +
    (fullnameKana.hashCode) +
    (companyName.hashCode) +
    (teamName == null ? 0 : teamName!.hashCode) +
    (teamId == null ? 0 : teamId!.hashCode) +
    (participantFee.hashCode) +
    (joinParty.hashCode) +
    (isStaff.hashCode) +
    (isPlayer.hashCode) +
    (hasSwitchDock.hashCode) +
    (hasCompanion.hashCode) +
    (reception == null ? 0 : reception!.hashCode);

  @override
  String toString() => 'ParticipantReception[id=$id, slackUserId=$slackUserId, nickname=$nickname, fullnameKana=$fullnameKana, companyName=$companyName, teamName=$teamName, teamId=$teamId, participantFee=$participantFee, joinParty=$joinParty, isStaff=$isStaff, isPlayer=$isPlayer, hasSwitchDock=$hasSwitchDock, hasCompanion=$hasCompanion, reception=$reception]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'slack_user_id'] = this.slackUserId;
      json[r'nickname'] = this.nickname;
      json[r'fullname_kana'] = this.fullnameKana;
      json[r'company_name'] = this.companyName;
    if (this.teamName != null) {
      json[r'team_name'] = this.teamName;
    } else {
      json[r'team_name'] = null;
    }
    if (this.teamId != null) {
      json[r'team_id'] = this.teamId;
    } else {
      json[r'team_id'] = null;
    }
      json[r'participant_fee'] = this.participantFee;
      json[r'join_party'] = this.joinParty;
      json[r'is_staff'] = this.isStaff;
      json[r'is_player'] = this.isPlayer;
      json[r'has_switch_dock'] = this.hasSwitchDock;
      json[r'has_companion'] = this.hasCompanion;
    if (this.reception != null) {
      json[r'reception'] = this.reception;
    } else {
      json[r'reception'] = null;
    }
    return json;
  }

  /// Returns a new [ParticipantReception] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ParticipantReception? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ParticipantReception[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ParticipantReception[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ParticipantReception(
        id: mapValueOfType<int>(json, r'id')!,
        slackUserId: mapValueOfType<String>(json, r'slack_user_id')!,
        nickname: mapValueOfType<String>(json, r'nickname')!,
        fullnameKana: mapValueOfType<String>(json, r'fullname_kana')!,
        companyName: mapValueOfType<String>(json, r'company_name')!,
        teamName: mapValueOfType<String>(json, r'team_name'),
        teamId: mapValueOfType<int>(json, r'team_id'),
        participantFee: mapValueOfType<int>(json, r'participant_fee')!,
        joinParty: mapValueOfType<bool>(json, r'join_party')!,
        isStaff: mapValueOfType<bool>(json, r'is_staff')!,
        isPlayer: mapValueOfType<bool>(json, r'is_player')!,
        hasSwitchDock: mapValueOfType<bool>(json, r'has_switch_dock')!,
        hasCompanion: mapValueOfType<bool>(json, r'has_companion')!,
        reception: Reception.fromJson(json[r'reception']),
      );
    }
    return null;
  }

  static List<ParticipantReception>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ParticipantReception>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ParticipantReception.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ParticipantReception> mapFromJson(dynamic json) {
    final map = <String, ParticipantReception>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ParticipantReception.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ParticipantReception-objects as value to a dart map
  static Map<String, List<ParticipantReception>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ParticipantReception>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ParticipantReception.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'slack_user_id',
    'nickname',
    'fullname_kana',
    'company_name',
    'participant_fee',
    'join_party',
    'is_staff',
    'is_player',
    'has_switch_dock',
    'has_companion',
  };
}

