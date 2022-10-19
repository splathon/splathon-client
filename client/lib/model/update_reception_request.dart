//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateReceptionRequest {
  /// Returns a new [UpdateReceptionRequest] instance.
  UpdateReceptionRequest({
    required this.participant,
    required this.complete,
  });

  ParticipantReception participant;

  bool complete;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateReceptionRequest &&
     other.participant == participant &&
     other.complete == complete;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (participant.hashCode) +
    (complete.hashCode);

  @override
  String toString() => 'UpdateReceptionRequest[participant=$participant, complete=$complete]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'participant'] = this.participant;
      json[r'complete'] = this.complete;
    return json;
  }

  /// Returns a new [UpdateReceptionRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateReceptionRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UpdateReceptionRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UpdateReceptionRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateReceptionRequest(
        participant: ParticipantReception.fromJson(json[r'participant'])!,
        complete: mapValueOfType<bool>(json, r'complete')!,
      );
    }
    return null;
  }

  static List<UpdateReceptionRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateReceptionRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateReceptionRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateReceptionRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateReceptionRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateReceptionRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateReceptionRequest-objects as value to a dart map
  static Map<String, List<UpdateReceptionRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateReceptionRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateReceptionRequest.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'participant',
    'complete',
  };
}

