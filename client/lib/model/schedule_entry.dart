//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ScheduleEntry {
  /// Returns a new [ScheduleEntry] instance.
  ScheduleEntry({
    this.title,
    this.startTimestampSec,
    this.durationSec,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  /// Unix timestamp in seconds.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? startTimestampSec;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? durationSec;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ScheduleEntry &&
     other.title == title &&
     other.startTimestampSec == startTimestampSec &&
     other.durationSec == durationSec;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (title == null ? 0 : title!.hashCode) +
    (startTimestampSec == null ? 0 : startTimestampSec!.hashCode) +
    (durationSec == null ? 0 : durationSec!.hashCode);

  @override
  String toString() => 'ScheduleEntry[title=$title, startTimestampSec=$startTimestampSec, durationSec=$durationSec]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.startTimestampSec != null) {
      json[r'start_timestamp_sec'] = this.startTimestampSec;
    } else {
      json[r'start_timestamp_sec'] = null;
    }
    if (this.durationSec != null) {
      json[r'duration_sec'] = this.durationSec;
    } else {
      json[r'duration_sec'] = null;
    }
    return json;
  }

  /// Returns a new [ScheduleEntry] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ScheduleEntry? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ScheduleEntry[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ScheduleEntry[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ScheduleEntry(
        title: mapValueOfType<String>(json, r'title'),
        startTimestampSec: mapValueOfType<int>(json, r'start_timestamp_sec'),
        durationSec: mapValueOfType<int>(json, r'duration_sec'),
      );
    }
    return null;
  }

  static List<ScheduleEntry>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ScheduleEntry>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ScheduleEntry.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ScheduleEntry> mapFromJson(dynamic json) {
    final map = <String, ScheduleEntry>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ScheduleEntry.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ScheduleEntry-objects as value to a dart map
  static Map<String, List<ScheduleEntry>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ScheduleEntry>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ScheduleEntry.listFromJson(entry.value, growable: growable,);
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

