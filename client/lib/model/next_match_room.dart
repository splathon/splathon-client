//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NextMatchRoom {
  /// Returns a new [NextMatchRoom] instance.
  NextMatchRoom({
    this.id,
    required this.name,
  });

  /// Room ID.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// Room name. e.g. A卓
  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NextMatchRoom &&
     other.id == id &&
     other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (name.hashCode);

  @override
  String toString() => 'NextMatchRoom[id=$id, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [NextMatchRoom] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NextMatchRoom? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NextMatchRoom[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NextMatchRoom[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NextMatchRoom(
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<NextMatchRoom>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NextMatchRoom>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NextMatchRoom.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NextMatchRoom> mapFromJson(dynamic json) {
    final map = <String, NextMatchRoom>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NextMatchRoom.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NextMatchRoom-objects as value to a dart map
  static Map<String, List<NextMatchRoom>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NextMatchRoom>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NextMatchRoom.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

