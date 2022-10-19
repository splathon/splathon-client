//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Rule {
  /// Returns a new [Rule] instance.
  Rule({
    required this.key,
    this.name,
  });

  /// Rule key. ref: https://splatoon2.ink/data/locale/ja.json
  RuleKeyEnum key;

  /// Localized rule name.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Rule &&
     other.key == key &&
     other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (key.hashCode) +
    (name == null ? 0 : name!.hashCode);

  @override
  String toString() => 'Rule[key=$key, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'key'] = this.key;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    return json;
  }

  /// Returns a new [Rule] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Rule? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Rule[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Rule[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Rule(
        key: RuleKeyEnum.fromJson(json[r'key'])!,
        name: mapValueOfType<String>(json, r'name'),
      );
    }
    return null;
  }

  static List<Rule>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Rule>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Rule.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Rule> mapFromJson(dynamic json) {
    final map = <String, Rule>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Rule.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Rule-objects as value to a dart map
  static Map<String, List<Rule>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Rule>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Rule.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'key',
  };
}

/// Rule key. ref: https://splatoon2.ink/data/locale/ja.json
class RuleKeyEnum {
  /// Instantiate a new enum with the provided [value].
  const RuleKeyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const turfWar = RuleKeyEnum._(r'turf_war');
  static const splatZones = RuleKeyEnum._(r'splat_zones');
  static const towerControl = RuleKeyEnum._(r'tower_control');
  static const rainmaker = RuleKeyEnum._(r'rainmaker');
  static const clamBlitz = RuleKeyEnum._(r'clam_blitz');

  /// List of all possible values in this [enum][RuleKeyEnum].
  static const values = <RuleKeyEnum>[
    turfWar,
    splatZones,
    towerControl,
    rainmaker,
    clamBlitz,
  ];

  static RuleKeyEnum? fromJson(dynamic value) => RuleKeyEnumTypeTransformer().decode(value);

  static List<RuleKeyEnum>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RuleKeyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RuleKeyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [RuleKeyEnum] to String,
/// and [decode] dynamic data back to [RuleKeyEnum].
class RuleKeyEnumTypeTransformer {
  factory RuleKeyEnumTypeTransformer() => _instance ??= const RuleKeyEnumTypeTransformer._();

  const RuleKeyEnumTypeTransformer._();

  String encode(RuleKeyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a RuleKeyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RuleKeyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'turf_war': return RuleKeyEnum.turfWar;
        case r'splat_zones': return RuleKeyEnum.splatZones;
        case r'tower_control': return RuleKeyEnum.towerControl;
        case r'rainmaker': return RuleKeyEnum.rainmaker;
        case r'clam_blitz': return RuleKeyEnum.clamBlitz;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [RuleKeyEnumTypeTransformer] instance.
  static RuleKeyEnumTypeTransformer? _instance;
}


