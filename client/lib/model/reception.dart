//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Reception {
  /// Returns a new [Reception] instance.
  Reception({
    this.id,
    required this.participantId,
    this.createdAtTimestampSec,
    this.updatedAtTimestampSec,
    this.memo,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  int participantId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? createdAtTimestampSec;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? updatedAtTimestampSec;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? memo;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Reception &&
     other.id == id &&
     other.participantId == participantId &&
     other.createdAtTimestampSec == createdAtTimestampSec &&
     other.updatedAtTimestampSec == updatedAtTimestampSec &&
     other.memo == memo;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (participantId.hashCode) +
    (createdAtTimestampSec == null ? 0 : createdAtTimestampSec!.hashCode) +
    (updatedAtTimestampSec == null ? 0 : updatedAtTimestampSec!.hashCode) +
    (memo == null ? 0 : memo!.hashCode);

  @override
  String toString() => 'Reception[id=$id, participantId=$participantId, createdAtTimestampSec=$createdAtTimestampSec, updatedAtTimestampSec=$updatedAtTimestampSec, memo=$memo]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'participant_id'] = this.participantId;
    if (this.createdAtTimestampSec != null) {
      json[r'created_at_timestamp_sec'] = this.createdAtTimestampSec;
    } else {
      json[r'created_at_timestamp_sec'] = null;
    }
    if (this.updatedAtTimestampSec != null) {
      json[r'updated_at_timestamp_sec'] = this.updatedAtTimestampSec;
    } else {
      json[r'updated_at_timestamp_sec'] = null;
    }
    if (this.memo != null) {
      json[r'memo'] = this.memo;
    } else {
      json[r'memo'] = null;
    }
    return json;
  }

  /// Returns a new [Reception] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Reception? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Reception[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Reception[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Reception(
        id: mapValueOfType<int>(json, r'id'),
        participantId: mapValueOfType<int>(json, r'participant_id')!,
        createdAtTimestampSec: mapValueOfType<int>(json, r'created_at_timestamp_sec'),
        updatedAtTimestampSec: mapValueOfType<int>(json, r'updated_at_timestamp_sec'),
        memo: mapValueOfType<String>(json, r'memo'),
      );
    }
    return null;
  }

  static List<Reception>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Reception>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Reception.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Reception> mapFromJson(dynamic json) {
    final map = <String, Reception>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Reception.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Reception-objects as value to a dart map
  static Map<String, List<Reception>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Reception>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Reception.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'participant_id',
  };
}

