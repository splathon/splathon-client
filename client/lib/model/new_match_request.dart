//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NewMatchRequest {
  /// Returns a new [NewMatchRequest] instance.
  NewMatchRequest({
    required this.alphaTeamId,
    required this.bravoTeamId,
    required this.roomId,
    required this.orderInRoom,
  });

  int alphaTeamId;

  int bravoTeamId;

  int roomId;

  /// Match order in this room.
  int orderInRoom;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NewMatchRequest &&
     other.alphaTeamId == alphaTeamId &&
     other.bravoTeamId == bravoTeamId &&
     other.roomId == roomId &&
     other.orderInRoom == orderInRoom;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (alphaTeamId.hashCode) +
    (bravoTeamId.hashCode) +
    (roomId.hashCode) +
    (orderInRoom.hashCode);

  @override
  String toString() => 'NewMatchRequest[alphaTeamId=$alphaTeamId, bravoTeamId=$bravoTeamId, roomId=$roomId, orderInRoom=$orderInRoom]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'alpha_team_id'] = this.alphaTeamId;
      json[r'bravo_team_id'] = this.bravoTeamId;
      json[r'room_id'] = this.roomId;
      json[r'order_in_room'] = this.orderInRoom;
    return json;
  }

  /// Returns a new [NewMatchRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NewMatchRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NewMatchRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NewMatchRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NewMatchRequest(
        alphaTeamId: mapValueOfType<int>(json, r'alpha_team_id')!,
        bravoTeamId: mapValueOfType<int>(json, r'bravo_team_id')!,
        roomId: mapValueOfType<int>(json, r'room_id')!,
        orderInRoom: mapValueOfType<int>(json, r'order_in_room')!,
      );
    }
    return null;
  }

  static List<NewMatchRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NewMatchRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NewMatchRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NewMatchRequest> mapFromJson(dynamic json) {
    final map = <String, NewMatchRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NewMatchRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NewMatchRequest-objects as value to a dart map
  static Map<String, List<NewMatchRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NewMatchRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NewMatchRequest.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'alpha_team_id',
    'bravo_team_id',
    'room_id',
    'order_in_room',
  };
}

