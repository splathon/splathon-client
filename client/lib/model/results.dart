//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Results {
  /// Returns a new [Results] instance.
  Results({
    this.qualifiers = const [],
    this.tournament = const [],
  });

  List<Round> qualifiers;

  List<Round> tournament;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Results &&
     other.qualifiers == qualifiers &&
     other.tournament == tournament;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (qualifiers.hashCode) +
    (tournament.hashCode);

  @override
  String toString() => 'Results[qualifiers=$qualifiers, tournament=$tournament]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'qualifiers'] = this.qualifiers;
      json[r'tournament'] = this.tournament;
    return json;
  }

  /// Returns a new [Results] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Results? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Results[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Results[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Results(
        qualifiers: Round.listFromJson(json[r'qualifiers']) ?? const [],
        tournament: Round.listFromJson(json[r'tournament']) ?? const [],
      );
    }
    return null;
  }

  static List<Results>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Results>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Results.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Results> mapFromJson(dynamic json) {
    final map = <String, Results>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Results.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Results-objects as value to a dart map
  static Map<String, List<Results>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Results>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Results.listFromJson(entry.value, growable: growable,);
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

