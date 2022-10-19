//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Round {
  /// Returns a new [Round] instance.
  Round({
    this.id,
    required this.name,
    this.round,
    this.rooms = const [],
  });

  /// Round ID. (Qualifier ID or Tournament ID)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// ラウンド名。e.g. 予選第1ラウンド, 決勝T1回戦, 決勝戦
  String name;

  /// 何ラウンドか。i.e. 予選第Nラウンド, 決勝T N回戦
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? round;

  List<Room> rooms;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Round &&
     other.id == id &&
     other.name == name &&
     other.round == round &&
     other.rooms == rooms;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (name.hashCode) +
    (round == null ? 0 : round!.hashCode) +
    (rooms.hashCode);

  @override
  String toString() => 'Round[id=$id, name=$name, round=$round, rooms=$rooms]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'name'] = this.name;
    if (this.round != null) {
      json[r'round'] = this.round;
    } else {
      json[r'round'] = null;
    }
      json[r'rooms'] = this.rooms;
    return json;
  }

  /// Returns a new [Round] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Round? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Round[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Round[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Round(
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name')!,
        round: mapValueOfType<int>(json, r'round'),
        rooms: Room.listFromJson(json[r'rooms']) ?? const [],
      );
    }
    return null;
  }

  static List<Round>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Round>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Round.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Round> mapFromJson(dynamic json) {
    final map = <String, Round>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Round.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Round-objects as value to a dart map
  static Map<String, List<Round>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Round>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Round.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

