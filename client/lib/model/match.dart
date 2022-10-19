//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Match {
  /// Returns a new [Match] instance.
  Match({
    required this.id,
    this.winner,
    this.order,
    required this.teamAlpha,
    required this.teamBravo,
    this.battles = const [],
    this.roundName,
  });

  /// Match ID
  int id;

  /// 勝者がどちらか。または引き分け。
  MatchWinnerEnum? winner;

  /// Room内でのマッチの順番
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? order;

  Team teamAlpha;

  Team teamBravo;

  List<Battle> battles;

  /// ラウンド名。e.g. 予選第1ラウンド, 決勝T1回戦, 決勝戦. Match APIから読んだときに埋まっている
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? roundName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Match &&
     other.id == id &&
     other.winner == winner &&
     other.order == order &&
     other.teamAlpha == teamAlpha &&
     other.teamBravo == teamBravo &&
     other.battles == battles &&
     other.roundName == roundName;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (winner == null ? 0 : winner!.hashCode) +
    (order == null ? 0 : order!.hashCode) +
    (teamAlpha.hashCode) +
    (teamBravo.hashCode) +
    (battles.hashCode) +
    (roundName == null ? 0 : roundName!.hashCode);

  @override
  String toString() => 'Match[id=$id, winner=$winner, order=$order, teamAlpha=$teamAlpha, teamBravo=$teamBravo, battles=$battles, roundName=$roundName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
    if (this.winner != null) {
      json[r'winner'] = this.winner;
    } else {
      json[r'winner'] = null;
    }
    if (this.order != null) {
      json[r'order'] = this.order;
    } else {
      json[r'order'] = null;
    }
      json[r'teamAlpha'] = this.teamAlpha;
      json[r'teamBravo'] = this.teamBravo;
      json[r'battles'] = this.battles;
    if (this.roundName != null) {
      json[r'round_name'] = this.roundName;
    } else {
      json[r'round_name'] = null;
    }
    return json;
  }

  /// Returns a new [Match] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Match? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Match[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Match[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Match(
        id: mapValueOfType<int>(json, r'id')!,
        winner: MatchWinnerEnum.fromJson(json[r'winner']),
        order: mapValueOfType<int>(json, r'order'),
        teamAlpha: Team.fromJson(json[r'teamAlpha'])!,
        teamBravo: Team.fromJson(json[r'teamBravo'])!,
        battles: Battle.listFromJson(json[r'battles']) ?? const [],
        roundName: mapValueOfType<String>(json, r'round_name'),
      );
    }
    return null;
  }

  static List<Match>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Match>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Match.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Match> mapFromJson(dynamic json) {
    final map = <String, Match>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Match.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Match-objects as value to a dart map
  static Map<String, List<Match>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Match>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Match.listFromJson(entry.value, growable: growable,);
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
    'teamAlpha',
    'teamBravo',
  };
}

/// 勝者がどちらか。または引き分け。
class MatchWinnerEnum {
  /// Instantiate a new enum with the provided [value].
  const MatchWinnerEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const alpha = MatchWinnerEnum._(r'alpha');
  static const bravo = MatchWinnerEnum._(r'bravo');
  static const draw = MatchWinnerEnum._(r'draw');

  /// List of all possible values in this [enum][MatchWinnerEnum].
  static const values = <MatchWinnerEnum>[
    alpha,
    bravo,
    draw,
  ];

  static MatchWinnerEnum? fromJson(dynamic value) => MatchWinnerEnumTypeTransformer().decode(value);

  static List<MatchWinnerEnum>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MatchWinnerEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MatchWinnerEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [MatchWinnerEnum] to String,
/// and [decode] dynamic data back to [MatchWinnerEnum].
class MatchWinnerEnumTypeTransformer {
  factory MatchWinnerEnumTypeTransformer() => _instance ??= const MatchWinnerEnumTypeTransformer._();

  const MatchWinnerEnumTypeTransformer._();

  String encode(MatchWinnerEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a MatchWinnerEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  MatchWinnerEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'alpha': return MatchWinnerEnum.alpha;
        case r'bravo': return MatchWinnerEnum.bravo;
        case r'draw': return MatchWinnerEnum.draw;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [MatchWinnerEnumTypeTransformer] instance.
  static MatchWinnerEnumTypeTransformer? _instance;
}


