//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ListReceptionResponse {
  /// Returns a new [ListReceptionResponse] instance.
  ListReceptionResponse({
    this.participants = const [],
  });

  List<ParticipantReception> participants;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ListReceptionResponse &&
     other.participants == participants;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (participants.hashCode);

  @override
  String toString() => 'ListReceptionResponse[participants=$participants]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'participants'] = this.participants;
    return json;
  }

  /// Returns a new [ListReceptionResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ListReceptionResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ListReceptionResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ListReceptionResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ListReceptionResponse(
        participants: ParticipantReception.listFromJson(json[r'participants']) ?? const [],
      );
    }
    return null;
  }

  static List<ListReceptionResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ListReceptionResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ListReceptionResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ListReceptionResponse> mapFromJson(dynamic json) {
    final map = <String, ListReceptionResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ListReceptionResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ListReceptionResponse-objects as value to a dart map
  static Map<String, List<ListReceptionResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ListReceptionResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ListReceptionResponse.listFromJson(entry.value, growable: growable,);
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

