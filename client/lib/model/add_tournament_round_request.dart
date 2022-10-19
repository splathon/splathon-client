//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AddTournamentRoundRequest {
  /// Returns a new [AddTournamentRoundRequest] instance.
  AddTournamentRoundRequest({
    required this.roundName,
    required this.round,
    this.matches = const [],
  });

  String roundName;

  int round;

  List<NewMatchRequest> matches;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AddTournamentRoundRequest &&
     other.roundName == roundName &&
     other.round == round &&
     other.matches == matches;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (roundName.hashCode) +
    (round.hashCode) +
    (matches.hashCode);

  @override
  String toString() => 'AddTournamentRoundRequest[roundName=$roundName, round=$round, matches=$matches]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'round_name'] = this.roundName;
      json[r'round'] = this.round;
      json[r'matches'] = this.matches;
    return json;
  }

  /// Returns a new [AddTournamentRoundRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AddTournamentRoundRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AddTournamentRoundRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AddTournamentRoundRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AddTournamentRoundRequest(
        roundName: mapValueOfType<String>(json, r'round_name')!,
        round: mapValueOfType<int>(json, r'round')!,
        matches: NewMatchRequest.listFromJson(json[r'matches'])!,
      );
    }
    return null;
  }

  static List<AddTournamentRoundRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AddTournamentRoundRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AddTournamentRoundRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AddTournamentRoundRequest> mapFromJson(dynamic json) {
    final map = <String, AddTournamentRoundRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AddTournamentRoundRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AddTournamentRoundRequest-objects as value to a dart map
  static Map<String, List<AddTournamentRoundRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AddTournamentRoundRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AddTournamentRoundRequest.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'round_name',
    'round',
    'matches',
  };
}

