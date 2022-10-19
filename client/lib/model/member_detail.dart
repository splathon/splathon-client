//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MemberDetail {
  /// Returns a new [MemberDetail] instance.
  MemberDetail({
    this.shortComment,
    this.rankSplatZones,
    this.rankTowerControl,
    this.rankRainmaker,
    this.rankClamBlitz,
    this.mainWeapon,
  });

  /// 一言コメント
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? shortComment;

  /// A+, X (2401~2500)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? rankSplatZones;

  /// A+, X (2401~2500)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? rankTowerControl;

  /// A+, X (2401~2500)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? rankRainmaker;

  /// A+, X (2401~2500)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? rankClamBlitz;

  /// メインウェポン/好きなブキ
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? mainWeapon;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MemberDetail &&
     other.shortComment == shortComment &&
     other.rankSplatZones == rankSplatZones &&
     other.rankTowerControl == rankTowerControl &&
     other.rankRainmaker == rankRainmaker &&
     other.rankClamBlitz == rankClamBlitz &&
     other.mainWeapon == mainWeapon;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (shortComment == null ? 0 : shortComment!.hashCode) +
    (rankSplatZones == null ? 0 : rankSplatZones!.hashCode) +
    (rankTowerControl == null ? 0 : rankTowerControl!.hashCode) +
    (rankRainmaker == null ? 0 : rankRainmaker!.hashCode) +
    (rankClamBlitz == null ? 0 : rankClamBlitz!.hashCode) +
    (mainWeapon == null ? 0 : mainWeapon!.hashCode);

  @override
  String toString() => 'MemberDetail[shortComment=$shortComment, rankSplatZones=$rankSplatZones, rankTowerControl=$rankTowerControl, rankRainmaker=$rankRainmaker, rankClamBlitz=$rankClamBlitz, mainWeapon=$mainWeapon]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.shortComment != null) {
      json[r'short_comment'] = this.shortComment;
    } else {
      json[r'short_comment'] = null;
    }
    if (this.rankSplatZones != null) {
      json[r'rank_splat_zones'] = this.rankSplatZones;
    } else {
      json[r'rank_splat_zones'] = null;
    }
    if (this.rankTowerControl != null) {
      json[r'rank_tower_control'] = this.rankTowerControl;
    } else {
      json[r'rank_tower_control'] = null;
    }
    if (this.rankRainmaker != null) {
      json[r'rank_rainmaker'] = this.rankRainmaker;
    } else {
      json[r'rank_rainmaker'] = null;
    }
    if (this.rankClamBlitz != null) {
      json[r'rank_clam_blitz'] = this.rankClamBlitz;
    } else {
      json[r'rank_clam_blitz'] = null;
    }
    if (this.mainWeapon != null) {
      json[r'main_weapon'] = this.mainWeapon;
    } else {
      json[r'main_weapon'] = null;
    }
    return json;
  }

  /// Returns a new [MemberDetail] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MemberDetail? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "MemberDetail[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "MemberDetail[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MemberDetail(
        shortComment: mapValueOfType<String>(json, r'short_comment'),
        rankSplatZones: mapValueOfType<String>(json, r'rank_splat_zones'),
        rankTowerControl: mapValueOfType<String>(json, r'rank_tower_control'),
        rankRainmaker: mapValueOfType<String>(json, r'rank_rainmaker'),
        rankClamBlitz: mapValueOfType<String>(json, r'rank_clam_blitz'),
        mainWeapon: mapValueOfType<String>(json, r'main_weapon'),
      );
    }
    return null;
  }

  static List<MemberDetail>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MemberDetail>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MemberDetail.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MemberDetail> mapFromJson(dynamic json) {
    final map = <String, MemberDetail>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MemberDetail.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MemberDetail-objects as value to a dart map
  static Map<String, List<MemberDetail>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MemberDetail>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MemberDetail.listFromJson(entry.value, growable: growable,);
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

