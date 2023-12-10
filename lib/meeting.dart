import 'dart:ui';

class Meeting {
  Meeting(
      {required this.eventName,
      required this.from,
      required this.background,
      required this.isAllDay,
      required this.to});

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
