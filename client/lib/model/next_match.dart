//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NextMatch {
  /// Returns a new [NextMatch] instance.
  NextMatch({
    this.ownTeam,
    this.opponentTeam,
    this.roundName,
    this.room,
    this.matchOrderInRoom,
    this.matchDetail,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Team? ownTeam;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Team? opponentTeam;

  /// ラウンド名。e.g. 予選第1ラウンド, 決勝T1回戦, 決勝戦.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? roundName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  NextMatchRoom? room;

  /// Room内でのマッチの順番
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? matchOrderInRoom;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Match? matchDetail;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NextMatch &&
     other.ownTeam == ownTeam &&
     other.opponentTeam == opponentTeam &&
     other.roundName == roundName &&
     other.room == room &&
     other.matchOrderInRoom == matchOrderInRoom &&
     other.matchDetail == matchDetail;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (ownTeam == null ? 0 : ownTeam!.hashCode) +
    (opponentTeam == null ? 0 : opponentTeam!.hashCode) +
    (roundName == null ? 0 : roundName!.hashCode) +
    (room == null ? 0 : room!.hashCode) +
    (matchOrderInRoom == null ? 0 : matchOrderInRoom!.hashCode) +
    (matchDetail == null ? 0 : matchDetail!.hashCode);

  @override
  String toString() => 'NextMatch[ownTeam=$ownTeam, opponentTeam=$opponentTeam, roundName=$roundName, room=$room, matchOrderInRoom=$matchOrderInRoom, matchDetail=$matchDetail]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.ownTeam != null) {
      json[r'own_team'] = this.ownTeam;
    } else {
      json[r'own_team'] = null;
    }
    if (this.opponentTeam != null) {
      json[r'opponent_team'] = this.opponentTeam;
    } else {
      json[r'opponent_team'] = null;
    }
    if (this.roundName != null) {
      json[r'round_name'] = this.roundName;
    } else {
      json[r'round_name'] = null;
    }
    if (this.room != null) {
      json[r'room'] = this.room;
    } else {
      json[r'room'] = null;
    }
    if (this.matchOrderInRoom != null) {
      json[r'match_order_in_room'] = this.matchOrderInRoom;
    } else {
      json[r'match_order_in_room'] = null;
    }
    if (this.matchDetail != null) {
      json[r'match_detail'] = this.matchDetail;
    } else {
      json[r'match_detail'] = null;
    }
    return json;
  }

  /// Returns a new [NextMatch] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NextMatch? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NextMatch[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NextMatch[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NextMatch(
        ownTeam: Team.fromJson(json[r'own_team']),
        opponentTeam: Team.fromJson(json[r'opponent_team']),
        roundName: mapValueOfType<String>(json, r'round_name'),
        room: NextMatchRoom.fromJson(json[r'room']),
        matchOrderInRoom: mapValueOfType<int>(json, r'match_order_in_room'),
        matchDetail: Match.fromJson(json[r'match_detail']),
      );
    }
    return null;
  }

  static List<NextMatch>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NextMatch>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NextMatch.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NextMatch> mapFromJson(dynamic json) {
    final map = <String, NextMatch>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NextMatch.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NextMatch-objects as value to a dart map
  static Map<String, List<NextMatch>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NextMatch>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NextMatch.listFromJson(entry.value, growable: growable,);
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

