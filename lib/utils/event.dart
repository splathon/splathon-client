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
  static final Event _singleton = Event._internal();
  // Private constractor
  Event._internal();
  factory Event() {
    return _singleton;
  }

  //static Event _singleton;
  EventBus bus = EventBus();

  // factory Event() {
  //   _singleton ??= new Event._internal();
  //   return _singleton;
  // }

  // // Private constractor
  // Event._internal();
}
