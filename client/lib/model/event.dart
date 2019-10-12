part of openapi.api;

class Event {
  
  String name = null;
  
  int numbering = null;
  
  List<Rule> rules = [];
  
  List<Stage> stages = [];
  
  List<SupportedRoom> rooms = [];
  Event();

  @override
  String toString() {
    return 'Event[name=$name, numbering=$numbering, rules=$rules, stages=$stages, rooms=$rooms, ]';
  }

  Event.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
    numbering = json['numbering'];
    rules = Rule.listFromJson(json['rules']);
    stages = Stage.listFromJson(json['stages']);
    rooms = SupportedRoom.listFromJson(json['rooms']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'numbering': numbering,
      'rules': rules,
      'stages': stages,
      'rooms': rooms
    };
  }

  static List<Event> listFromJson(List<dynamic> json) {
    return json == null ? new List<Event>() : json.map((value) => new Event.fromJson(value)).toList();
  }

  static Map<String, Event> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Event>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Event.fromJson(value));
    }
    return map;
  }
}

