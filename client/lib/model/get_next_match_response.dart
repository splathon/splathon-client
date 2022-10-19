//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetNextMatchResponse {
  /// Returns a new [GetNextMatchResponse] instance.
  GetNextMatchResponse({
    this.nextMatch,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  NextMatch? nextMatch;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetNextMatchResponse &&
     other.nextMatch == nextMatch;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (nextMatch == null ? 0 : nextMatch!.hashCode);

  @override
  String toString() => 'GetNextMatchResponse[nextMatch=$nextMatch]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.nextMatch != null) {
      json[r'next_match'] = this.nextMatch;
    } else {
      json[r'next_match'] = null;
    }
    return json;
  }

  /// Returns a new [GetNextMatchResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetNextMatchResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GetNextMatchResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GetNextMatchResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetNextMatchResponse(
        nextMatch: NextMatch.fromJson(json[r'next_match']),
      );
    }
    return null;
  }

  static List<GetNextMatchResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetNextMatchResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetNextMatchResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetNextMatchResponse> mapFromJson(dynamic json) {
    final map = <String, GetNextMatchResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetNextMatchResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetNextMatchResponse-objects as value to a dart map
  static Map<String, List<GetNextMatchResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetNextMatchResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetNextMatchResponse.listFromJson(entry.value, growable: growable,);
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

