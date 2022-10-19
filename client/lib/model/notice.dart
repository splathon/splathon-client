//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Notice {
  /// Returns a new [Notice] instance.
  Notice({
    this.id,
    required this.text,
    required this.timestampSec,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  String text;

  int timestampSec;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Notice &&
     other.id == id &&
     other.text == text &&
     other.timestampSec == timestampSec;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (text.hashCode) +
    (timestampSec.hashCode);

  @override
  String toString() => 'Notice[id=$id, text=$text, timestampSec=$timestampSec]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'text'] = this.text;
      json[r'timestamp_sec'] = this.timestampSec;
    return json;
  }

  /// Returns a new [Notice] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Notice? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Notice[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Notice[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Notice(
        id: mapValueOfType<int>(json, r'id'),
        text: mapValueOfType<String>(json, r'text')!,
        timestampSec: mapValueOfType<int>(json, r'timestamp_sec')!,
      );
    }
    return null;
  }

  static List<Notice>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Notice>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Notice.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Notice> mapFromJson(dynamic json) {
    final map = <String, Notice>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Notice.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Notice-objects as value to a dart map
  static Map<String, List<Notice>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Notice>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Notice.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'text',
    'timestamp_sec',
  };
}

