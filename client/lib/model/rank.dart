//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Rank {
  /// Returns a new [Rank] instance.
  Rank({
    required this.rank,
    required this.team,
    required this.point,
    this.omwp,
    this.numOfMatches,
  });

  /// 順位
  int rank;

  Team team;

  /// 勝ち点
  int point;

  /// OMWP (Opponent Match Win Percentage)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? omwp;

  /// 何戦こなしたか。
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? numOfMatches;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Rank &&
     other.rank == rank &&
     other.team == team &&
     other.point == point &&
     other.omwp == omwp &&
     other.numOfMatches == numOfMatches;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (rank.hashCode) +
    (team.hashCode) +
    (point.hashCode) +
    (omwp == null ? 0 : omwp!.hashCode) +
    (numOfMatches == null ? 0 : numOfMatches!.hashCode);

  @override
  String toString() => 'Rank[rank=$rank, team=$team, point=$point, omwp=$omwp, numOfMatches=$numOfMatches]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'rank'] = this.rank;
      json[r'team'] = this.team;
      json[r'point'] = this.point;
    if (this.omwp != null) {
      json[r'omwp'] = this.omwp;
    } else {
      json[r'omwp'] = null;
    }
    if (this.numOfMatches != null) {
      json[r'num_of_matches'] = this.numOfMatches;
    } else {
      json[r'num_of_matches'] = null;
    }
    return json;
  }

  /// Returns a new [Rank] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Rank? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Rank[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Rank[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Rank(
        rank: mapValueOfType<int>(json, r'rank')!,
        team: Team.fromJson(json[r'team'])!,
        point: mapValueOfType<int>(json, r'point')!,
        omwp: json[r'omwp'] == null
            ? null
            : num.parse(json[r'omwp'].toString()),
        numOfMatches: mapValueOfType<int>(json, r'num_of_matches'),
      );
    }
    return null;
  }

  static List<Rank>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Rank>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Rank.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Rank> mapFromJson(dynamic json) {
    final map = <String, Rank>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Rank.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Rank-objects as value to a dart map
  static Map<String, List<Rank>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Rank>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Rank.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'rank',
    'team',
    'point',
  };
}

