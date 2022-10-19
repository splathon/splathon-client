//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ListNoticesResponse {
  /// Returns a new [ListNoticesResponse] instance.
  ListNoticesResponse({
    this.notices = const [],
  });

  /// List of notices ordered by reverse chronological order.
  List<Notice> notices;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ListNoticesResponse &&
     other.notices == notices;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (notices.hashCode);

  @override
  String toString() => 'ListNoticesResponse[notices=$notices]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'notices'] = this.notices;
    return json;
  }

  /// Returns a new [ListNoticesResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ListNoticesResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ListNoticesResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ListNoticesResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ListNoticesResponse(
        notices: Notice.listFromJson(json[r'notices']) ?? const [],
      );
    }
    return null;
  }

  static List<ListNoticesResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ListNoticesResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ListNoticesResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ListNoticesResponse> mapFromJson(dynamic json) {
    final map = <String, ListNoticesResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ListNoticesResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ListNoticesResponse-objects as value to a dart map
  static Map<String, List<ListNoticesResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ListNoticesResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ListNoticesResponse.listFromJson(entry.value, growable: growable,);
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

