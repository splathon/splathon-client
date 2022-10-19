//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Battle {
  /// Returns a new [Battle] instance.
  Battle({
    this.id,
    this.winner,
    required this.order,
    this.rule,
    this.stage,
  });

  /// Battle ID
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// 勝者がどちらか。
  BattleWinnerEnum? winner;

  /// 何戦目か
  int order;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Rule? rule;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Stage? stage;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Battle &&
     other.id == id &&
     other.winner == winner &&
     other.order == order &&
     other.rule == rule &&
     other.stage == stage;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (winner == null ? 0 : winner!.hashCode) +
    (order.hashCode) +
    (rule == null ? 0 : rule!.hashCode) +
    (stage == null ? 0 : stage!.hashCode);

  @override
  String toString() => 'Battle[id=$id, winner=$winner, order=$order, rule=$rule, stage=$stage]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.winner != null) {
      json[r'winner'] = this.winner;
    } else {
      json[r'winner'] = null;
    }
      json[r'order'] = this.order;
    if (this.rule != null) {
      json[r'rule'] = this.rule;
    } else {
      json[r'rule'] = null;
    }
    if (this.stage != null) {
      json[r'stage'] = this.stage;
    } else {
      json[r'stage'] = null;
    }
    return json;
  }

  /// Returns a new [Battle] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Battle? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Battle[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Battle[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Battle(
        id: mapValueOfType<int>(json, r'id'),
        winner: BattleWinnerEnum.fromJson(json[r'winner']),
        order: mapValueOfType<int>(json, r'order')!,
        rule: Rule.fromJson(json[r'rule']),
        stage: Stage.fromJson(json[r'stage']),
      );
    }
    return null;
  }

  static List<Battle>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Battle>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Battle.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Battle> mapFromJson(dynamic json) {
    final map = <String, Battle>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Battle.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Battle-objects as value to a dart map
  static Map<String, List<Battle>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Battle>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Battle.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'order',
  };
}

/// 勝者がどちらか。
class BattleWinnerEnum {
  /// Instantiate a new enum with the provided [value].
  const BattleWinnerEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const alpha = BattleWinnerEnum._(r'alpha');
  static const bravo = BattleWinnerEnum._(r'bravo');

  /// List of all possible values in this [enum][BattleWinnerEnum].
  static const values = <BattleWinnerEnum>[
    alpha,
    bravo,
  ];

  static BattleWinnerEnum? fromJson(dynamic value) => BattleWinnerEnumTypeTransformer().decode(value);

  static List<BattleWinnerEnum>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BattleWinnerEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BattleWinnerEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BattleWinnerEnum] to String,
/// and [decode] dynamic data back to [BattleWinnerEnum].
class BattleWinnerEnumTypeTransformer {
  factory BattleWinnerEnumTypeTransformer() => _instance ??= const BattleWinnerEnumTypeTransformer._();

  const BattleWinnerEnumTypeTransformer._();

  String encode(BattleWinnerEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a BattleWinnerEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BattleWinnerEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'alpha': return BattleWinnerEnum.alpha;
        case r'bravo': return BattleWinnerEnum.bravo;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [BattleWinnerEnumTypeTransformer] instance.
  static BattleWinnerEnumTypeTransformer? _instance;
}


