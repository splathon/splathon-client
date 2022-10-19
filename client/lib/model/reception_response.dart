//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ReceptionResponse {
  /// Returns a new [ReceptionResponse] instance.
  ReceptionResponse({
    this.building,
    this.splathon,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ReceptionCode? building;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ReceptionCode? splathon;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ReceptionResponse &&
     other.building == building &&
     other.splathon == splathon;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (building == null ? 0 : building!.hashCode) +
    (splathon == null ? 0 : splathon!.hashCode);

  @override
  String toString() => 'ReceptionResponse[building=$building, splathon=$splathon]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.building != null) {
      json[r'building'] = this.building;
    } else {
      json[r'building'] = null;
    }
    if (this.splathon != null) {
      json[r'splathon'] = this.splathon;
    } else {
      json[r'splathon'] = null;
    }
    return json;
  }

  /// Returns a new [ReceptionResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ReceptionResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ReceptionResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ReceptionResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ReceptionResponse(
        building: ReceptionCode.fromJson(json[r'building']),
        splathon: ReceptionCode.fromJson(json[r'splathon']),
      );
    }
    return null;
  }

  static List<ReceptionResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ReceptionResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ReceptionResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ReceptionResponse> mapFromJson(dynamic json) {
    final map = <String, ReceptionResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ReceptionResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ReceptionResponse-objects as value to a dart map
  static Map<String, List<ReceptionResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ReceptionResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ReceptionResponse.listFromJson(entry.value, growable: growable,);
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

