//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Event {
  /// Returns a new [Event] instance.
  Event({
    required this.name,
    required this.numbering,
    this.rules = const [],
    this.stages = const [],
    this.rooms = const [],
  });

  String name;

  int numbering;

  List<Rule> rules;

  List<Stage> stages;

  List<SupportedRoom> rooms;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Event &&
     other.name == name &&
     other.numbering == numbering &&
     other.rules == rules &&
     other.stages == stages &&
     other.rooms == rooms;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (numbering.hashCode) +
    (rules.hashCode) +
    (stages.hashCode) +
    (rooms.hashCode);

  @override
  String toString() => 'Event[name=$name, numbering=$numbering, rules=$rules, stages=$stages, rooms=$rooms]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'numbering'] = this.numbering;
      json[r'rules'] = this.rules;
      json[r'stages'] = this.stages;
      json[r'rooms'] = this.rooms;
    return json;
  }

  /// Returns a new [Event] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Event? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Event[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Event[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Event(
        name: mapValueOfType<String>(json, r'name')!,
        numbering: mapValueOfType<int>(json, r'numbering')!,
        rules: Rule.listFromJson(json[r'rules']) ?? const [],
        stages: Stage.listFromJson(json[r'stages']) ?? const [],
        rooms: SupportedRoom.listFromJson(json[r'rooms']) ?? const [],
      );
    }
    return null;
  }

  static List<Event>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Event>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Event.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Event> mapFromJson(dynamic json) {
    final map = <String, Event>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Event.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Event-objects as value to a dart map
  static Map<String, List<Event>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Event>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Event.listFromJson(entry.value, growable: growable,);
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
    'numbering',
  };
}

