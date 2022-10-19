//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ReceptionPartcipantsDataResponse {
  /// Returns a new [ReceptionPartcipantsDataResponse] instance.
  ReceptionPartcipantsDataResponse({
    this.description,
    this.slackInternalId,
    this.participants = const [],
  });

  /// 受付の仕方の説明や注意点などのフリーテキスト。
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// 参加者の Slack Internal ID
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? slackInternalId;

  /// 1つのSlackIDで複数の参加者をカバーしている。また participants とは別に参加者情報のない同伴者が存在する可能性があり、 もしいる場合は has_companion flag が true となる
  List<ParticipantReception> participants;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ReceptionPartcipantsDataResponse &&
     other.description == description &&
     other.slackInternalId == slackInternalId &&
     other.participants == participants;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (slackInternalId == null ? 0 : slackInternalId!.hashCode) +
    (participants.hashCode);

  @override
  String toString() => 'ReceptionPartcipantsDataResponse[description=$description, slackInternalId=$slackInternalId, participants=$participants]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.slackInternalId != null) {
      json[r'slack_internal_id'] = this.slackInternalId;
    } else {
      json[r'slack_internal_id'] = null;
    }
      json[r'participants'] = this.participants;
    return json;
  }

  /// Returns a new [ReceptionPartcipantsDataResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ReceptionPartcipantsDataResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ReceptionPartcipantsDataResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ReceptionPartcipantsDataResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ReceptionPartcipantsDataResponse(
        description: mapValueOfType<String>(json, r'description'),
        slackInternalId: mapValueOfType<String>(json, r'slack_internal_id'),
        participants: ParticipantReception.listFromJson(json[r'participants']) ?? const [],
      );
    }
    return null;
  }

  static List<ReceptionPartcipantsDataResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ReceptionPartcipantsDataResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ReceptionPartcipantsDataResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ReceptionPartcipantsDataResponse> mapFromJson(dynamic json) {
    final map = <String, ReceptionPartcipantsDataResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ReceptionPartcipantsDataResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ReceptionPartcipantsDataResponse-objects as value to a dart map
  static Map<String, List<ReceptionPartcipantsDataResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ReceptionPartcipantsDataResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ReceptionPartcipantsDataResponse.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

