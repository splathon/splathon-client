//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SupportedRoom {
  /// Returns a new [SupportedRoom] instance.
  SupportedRoom({
    required this.id,
    required this.name,
    required this.priority,
  });

  /// Room ID.
  int id;

  /// Room name. e.g. A卓
  String name;

  int priority;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SupportedRoom &&
     other.id == id &&
     other.name == name &&
     other.priority == priority;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (name.hashCode) +
    (priority.hashCode);

  @override
  String toString() => 'SupportedRoom[id=$id, name=$name, priority=$priority]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'name'] = this.name;
      json[r'priority'] = this.priority;
    return json;
  }

  /// Returns a new [SupportedRoom] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SupportedRoom? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SupportedRoom[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SupportedRoom[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SupportedRoom(
        id: mapValueOfType<int>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        priority: mapValueOfType<int>(json, r'priority')!,
      );
    }
    return null;
  }

  static List<SupportedRoom>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SupportedRoom>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SupportedRoom.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SupportedRoom> mapFromJson(dynamic json) {
    final map = <String, SupportedRoom>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SupportedRoom.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SupportedRoom-objects as value to a dart map
  static Map<String, List<SupportedRoom>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SupportedRoom>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SupportedRoom.listFromJson(entry.value, growable: growable,);
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
    'name',
    'priority',
  };
}

