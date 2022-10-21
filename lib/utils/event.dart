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
  static EventBus bus = EventBus();
}
