import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

class NotificationReload {}
class ResultReload {}
class RankingReload {}
class ReceptionReload {}

class MyResultReload {}
class AllResultReload {}
class EnterBuildingReload {}
class EnterSplathonReload {}

class Event {
  static Event _singleton;
  EventBus bus = EventBus();

  factory Event() {
    if (_singleton == null) {
      _singleton = new Event._internal();
    }
    return _singleton;
  }

  // Private constractor
  Event._internal();
}