// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:sfcalender/calendar_page.dart';
// // import 'package:sfcalender/general_info.dart';
// // import 'package:sfcalender/main.dart';
// // import 'package:syncfusion_flutter_calendar/calendar.dart';
// // import 'package:uuid/uuid.dart';

// // class CalendarPage extends StatefulWidget {
// //   final Map<String, dynamic> calendarInfo;

// //   const CalendarPage({Key? key, required this.calendarInfo}) : super(key: key);

// //   @override
// //   _CalendarPageState createState() => _CalendarPageState();
// // }

// // class _CalendarPageState extends State<CalendarPage> {
// //   final List<Meeting> meetings = [];
// //   final CalendarController _controller = CalendarController();
// //   final Uuid uuid = Uuid();
// //   List<DateTime> blackoutDates = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     _initializeBlackoutDates();
// //   }

// //   void _initializeBlackoutDates() {
// //     final workingStartHour = widget.calendarInfo['workingStartHour'];
// //     final workingEndHour = widget.calendarInfo['workingEndHour'];
// //     final lessonDuration = widget.calendarInfo['lessonDuration'];
// //     final restDuration = widget.calendarInfo['restDuration'];
// //     final blockedHours = widget.calendarInfo['blockedHours'];

// //     // Add blocked hours as blackout dates
// //     for (var blockedHour in blockedHours) {
// //       final times = blockedHour.split('-');
// //       final startTime = DateFormat('HH:mm').parse(times[0]);
// //       final endTime = DateFormat('HH:mm').parse(times[1]);
// //       final now = DateTime.now();
// //       blackoutDates.add(DateTime(
// //           now.year, now.month, now.day, startTime.hour, startTime.minute));
// //       blackoutDates.add(
// //           DateTime(now.year, now.month, now.day, endTime.hour, endTime.minute));
// //     }
// //   }

// //   void _addMeeting(String eventName, DateTime from, DateTime to) {
// //     setState(() {
// //       meetings.add(
// //         Meeting(
// //           eventName: eventName,
// //           from: from,
// //           to: to,
// //           background: Colors.blue,
// //         ),
// //       );
// //     });
// //   }

// //   void _showAddMeetingDialog(BuildContext context, DateTime selectedDate) {
// //     final TextEditingController eventNameController = TextEditingController();
// //     final TextEditingController durationController = TextEditingController();

// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: const Text('Add Meeting'),
// //           content: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               TextField(
// //                 controller: eventNameController,
// //                 decoration: const InputDecoration(
// //                   labelText: 'Event Name',
// //                 ),
// //               ),
// //               TextField(
// //                 controller: durationController,
// //                 decoration: const InputDecoration(
// //                   labelText: 'Duration in hours',
// //                 ),
// //                 keyboardType: TextInputType.number,
// //               ),
// //             ],
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //               child: const Text('Cancel'),
// //             ),
// //             TextButton(
// //               onPressed: () {
// //                 final String eventName = eventNameController.text;
// //                 final int duration = int.tryParse(durationController.text) ?? 1;
// //                 final DateTime startTime = selectedDate;
// //                 final DateTime endTime =
// //                     startTime.add(Duration(hours: duration));

// //                 _addMeeting(eventName, startTime, endTime);

// //                 Navigator.of(context).pop();
// //               },
// //               child: const Text('Add'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.calendarInfo['calendarName']),
// //         centerTitle: true,
// //       ),
// //       body: SfCalendar(
// //         view: CalendarView.day,
// //         controller: _controller,
// //         dataSource: MeetingDataSource(meetings),
// //         blackoutDates: blackoutDates,
// //         onTap: (CalendarTapDetails details) {
// //           if (details.targetElement == CalendarElement.calendarCell) {
// //             final DateTime selectedDate = details.date!;
// //             _showAddMeetingDialog(context, selectedDate);
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:syncfusion_flutter_calendar/calendar.dart';
// // import 'package:uuid/uuid.dart';

// // class Meeting {
// //   Meeting({
// //     required this.eventName,
// //     required this.from,
// //     required this.to,
// //     required this.background,
// //     this.isAllDay = false,
// //   });

// //   String eventName;
// //   DateTime from;
// //   DateTime to;
// //   Color background;
// //   bool isAllDay;
// // }

// // class MeetingDataSource extends CalendarDataSource {
// //   MeetingDataSource(List<Meeting> meetings) {
// //     appointments = meetings;
// //   }

// //   @override
// //   DateTime getStartTime(int index) {
// //     return appointments![index].from;
// //   }

// //   @override
// //   DateTime getEndTime(int index) {
// //     return appointments![index].to;
// //   }

// //   @override
// //   String getSubject(int index) {
// //     return appointments![index].eventName;
// //   }

// //   @override
// //   Color getColor(int index) {
// //     return appointments![index].background;
// //   }

// //   @override
// //   bool isAllDay(int index) {
// //     return appointments![index].isAllDay;
// //   }
// // }

// // class CalendarPage extends StatefulWidget {
// //   final Map<String, dynamic> calendarInfo;

// //   const CalendarPage({Key? key, required this.calendarInfo}) : super(key: key);

// //   @override
// //   _CalendarPageState createState() => _CalendarPageState();
// // }

// // class _CalendarPageState extends State<CalendarPage> {
// //   final List<Meeting> meetings = [];
// //   final CalendarController _controller = CalendarController();
// //   final Uuid uuid = Uuid();
// //   List<TimeRegion> specialRegions = [];
// //   late DateTime workingStartTime;
// //   late DateTime workingEndTime;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _initializeSpecialRegions();
// //     _initializeTimeSlots();
// //   }

// //   void _initializeSpecialRegions() {
// //     final workingStartHour = widget.calendarInfo['workingStartHour'];
// //     final workingEndHour = widget.calendarInfo['workingEndHour'];
// //     final blockedHours = widget.calendarInfo['blockedHours'];

// //     workingStartTime = DateFormat('HH:mm').parse(workingStartHour);
// //     workingEndTime = DateFormat('HH:mm').parse(workingEndHour);

// //     final now = DateTime.now();

// //     // Çalışma saatleri dışındaki zaman dilimlerini siyah yapma
// //     specialRegions.add(TimeRegion(
// //       startTime: DateTime(now.year, now.month, now.day, 0, 0),
// //       endTime: DateTime(now.year, now.month, now.day, workingStartTime.hour,
// //           workingStartTime.minute),
// //       color: Colors.black,
// //     ));

// //     specialRegions.add(TimeRegion(
// //       startTime: DateTime(now.year, now.month, now.day, workingEndTime.hour,
// //           workingEndTime.minute),
// //       endTime: DateTime(now.year, now.month, now.day, 23, 59),
// //       color: Colors.black,
// //     ));

// //     // Bloklanmış saatleri kırmızı yapma
// //     for (var blockedHour in blockedHours) {
// //       final times = blockedHour.split('-');
// //       final startTime = DateFormat('HH:mm').parse(times[0]);
// //       final endTime = DateFormat('HH:mm').parse(times[1]);

// //       specialRegions.add(TimeRegion(
// //         startTime: DateTime(
// //             now.year, now.month, now.day, startTime.hour, startTime.minute),
// //         endTime: DateTime(
// //             now.year, now.month, now.day, endTime.hour, endTime.minute),
// //         color: Colors.red,
// //       ));
// //     }
// //   }

// //   void _initializeTimeSlots() {
// //     final workingStartHour = widget.calendarInfo['workingStartHour'];
// //     final workingEndHour = widget.calendarInfo['workingEndHour'];
// //     final lessonDuration = widget.calendarInfo['lessonDuration'];
// //     final restDuration = widget.calendarInfo['restDuration'];

// //     final workingStartTime = DateFormat('HH:mm').parse(workingStartHour);
// //     final workingEndTime = DateFormat('HH:mm').parse(workingEndHour);

// //     DateTime currentSlotStartTime = DateTime(
// //       DateTime.now().year,
// //       DateTime.now().month,
// //       DateTime.now().day,
// //       workingStartTime.hour,
// //       workingStartTime.minute,
// //     );

// //     DateTime currentSlotEndTime;

// //     while (currentSlotStartTime.isBefore(
// //       DateTime(
// //         DateTime.now().year,
// //         DateTime.now().month,
// //         DateTime.now().day,
// //         workingEndTime.hour,
// //         workingEndTime.minute,
// //       ),
// //     )) {
// //       currentSlotEndTime =
// //           currentSlotStartTime.add(Duration(minutes: lessonDuration));
// //       if (currentSlotEndTime.isAfter(
// //         DateTime(
// //           DateTime.now().year,
// //           DateTime.now().month,
// //           DateTime.now().day,
// //           workingEndTime.hour,
// //           workingEndTime.minute,
// //         ),
// //       )) {
// //         break;
// //       }

// //       meetings.add(Meeting(
// //         eventName: "Available Slot",
// //         from: currentSlotStartTime,
// //         to: currentSlotEndTime,
// //         background: Colors.green,
// //       ));

// //       currentSlotStartTime =
// //           currentSlotEndTime.add(Duration(minutes: restDuration));
// //     }
// //   }

// //   void _addMeeting(String eventName, DateTime from, DateTime to) {
// //     setState(() {
// //       meetings.add(
// //         Meeting(
// //           eventName: eventName,
// //           from: from,
// //           to: to,
// //           background: Colors.blue,
// //         ),
// //       );
// //     });
// //   }

// //   void _showAddMeetingDialog(BuildContext context, DateTime selectedDate) {
// //     final TextEditingController eventNameController = TextEditingController();

// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: const Text('Add Meeting'),
// //           content: TextField(
// //             controller: eventNameController,
// //             decoration: const InputDecoration(
// //               labelText: 'Event Name',
// //             ),
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //               child: const Text('Cancel'),
// //             ),
// //             TextButton(
// //               onPressed: () {
// //                 final String eventName = eventNameController.text;

// //                 _addMeeting(
// //                     eventName,
// //                     selectedDate,
// //                     selectedDate.add(Duration(
// //                         minutes: widget.calendarInfo['lessonDuration'])));

// //                 Navigator.of(context).pop();
// //               },
// //               child: const Text('Add'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.calendarInfo['calendarName']),
// //         centerTitle: true,
// //       ),
// //       body: SfCalendar(
// //         view: CalendarView.day,
// //         controller: _controller,
// //         dataSource: MeetingDataSource(meetings),
// //         specialRegions: specialRegions,
// //         onTap: (CalendarTapDetails details) {
// //           final DateTime selectedDate = details.date!;
// //           final DateTime selectedTime = DateTime(
// //             selectedDate.year,
// //             selectedDate.month,
// //             selectedDate.day,
// //             selectedDate.hour,
// //             selectedDate.minute,
// //           );

// //           // Çalışma saatleri dışında ve bloklanmış saatlere tıklamayı engelle
// //           if (selectedTime.isBefore(DateTime(
// //                   selectedDate.year,
// //                   selectedDate.month,
// //                   selectedDate.day,
// //                   workingStartTime.hour,
// //                   workingStartTime.minute)) ||
// //               selectedTime.isAfter(DateTime(
// //                   selectedDate.year,
// //                   selectedDate.month,
// //                   selectedDate.day,
// //                   workingEndTime.hour,
// //                   workingEndTime.minute)) ||
// //               specialRegions.any((region) =>
// //                   selectedTime.isAfter(region.startTime) &&
// //                   selectedTime.isBefore(region.endTime))) {
// //             return;
// //           }

// //           // Yalnızca yeşil slotlara tıklamayı etkinleştirme
// //           if (details.targetElement == CalendarElement.calendarCell &&
// //               details.appointments != null &&
// //               details.appointments!.isNotEmpty &&
// //               details.appointments!.first.background == Colors.green) {
// //             _showAddMeetingDialog(context, details.date!);
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:uuid/uuid.dart';

// class Meeting {
//   Meeting({
//     required this.eventName,
//     required this.from,
//     required this.to,
//     required this.background,
//     this.isAllDay = false,
//   });

//   String eventName;
//   DateTime from;
//   DateTime to;
//   Color background;
//   bool isAllDay;
// }

// class MeetingDataSource extends CalendarDataSource {
//   MeetingDataSource(List<Meeting> meetings) {
//     appointments = meetings;
//   }

//   @override
//   DateTime getStartTime(int index) {
//     return appointments![index].from;
//   }

//   @override
//   DateTime getEndTime(int index) {
//     return appointments![index].to;
//   }

//   @override
//   String getSubject(int index) {
//     return appointments![index].eventName;
//   }

//   @override
//   Color getColor(int index) {
//     return appointments![index].background;
//   }

//   @override
//   bool isAllDay(int index) {
//     return appointments![index].isAllDay;
//   }
// }

// class CalendarPage extends StatefulWidget {
//   final Map<String, dynamic> calendarInfo;

//   const CalendarPage({Key? key, required this.calendarInfo}) : super(key: key);

//   @override
//   _CalendarPageState createState() => _CalendarPageState();
// }

// class _CalendarPageState extends State<CalendarPage> {
//   final List<Meeting> meetings = [];
//   final CalendarController _controller = CalendarController();
//   final Uuid uuid = Uuid();
//   List<TimeRegion> specialRegions = [];

//   @override
//   void initState() {
//     super.initState();
//     _initializeSpecialRegions();
//     _initializeTimeSlots();
//   }

//   void _initializeSpecialRegions() {
//     final workingStartHour = widget.calendarInfo['workingStartHour'];
//     final workingEndHour = widget.calendarInfo['workingEndHour'];
//     final blockedHours = widget.calendarInfo['blockedHours'];

//     final workingStartTime = DateFormat('HH:mm').parse(workingStartHour);
//     final workingEndTime = DateFormat('HH:mm').parse(workingEndHour);

//     final now = DateTime.now();

//     // Çalışma saatleri dışındaki zaman dilimlerini siyah yap break time vakitleri
//     specialRegions.add(TimeRegion(
//       recurrenceRule: 'FREQ=DAILY;INTERVAL=1',
//       startTime: DateTime(now.year, now.month, now.day, 0, 0),
//       endTime: DateTime(now.year, now.month, now.day, workingStartTime.hour,
//           workingStartTime.minute),
//       color: Colors.black,
//     ));

//     specialRegions.add(TimeRegion(
//       recurrenceRule: 'FREQ=DAILY;INTERVAL=1',
//       startTime: DateTime(now.year, now.month, now.day, workingEndTime.hour,
//           workingEndTime.minute),
//       endTime: DateTime(now.year, now.month, now.day, 23, 59),
//       color: Colors.black,
//     ));

//     // Bloklanmış saatleri kırmızı yapma
//     for (var blockedHour in blockedHours) {
//       final times = blockedHour.split('-');
//       final startTime = DateFormat('HH:mm').parse(times[0]);
//       final endTime = DateFormat('HH:mm').parse(times[1]);

//       specialRegions.add(TimeRegion(
//         recurrenceRule: 'FREQ=DAILY;INTERVAL=1',
//         textStyle: const TextStyle(color: Colors.red, fontSize: 15),
//         iconData: Icons.group,
//         startTime: DateTime(
//             now.year, now.month, now.day, startTime.hour, startTime.minute),
//         endTime: DateTime(
//             now.year, now.month, now.day, endTime.hour, endTime.minute),
//         color: Colors.red,
//       ));
//     }
//   }

//   void _initializeTimeSlots() {
//     final workingStartHour = widget.calendarInfo['workingStartHour'];
//     final workingEndHour = widget.calendarInfo['workingEndHour'];
//     final lessonDuration = widget.calendarInfo['lessonDuration'];
//     final restDuration = widget.calendarInfo['restDuration'];

//     final workingStartTime = DateFormat('HH:mm').parse(workingStartHour);
//     final workingEndTime = DateFormat('HH:mm').parse(workingEndHour);

//     DateTime currentSlotStartTime = DateTime(
//       DateTime.now().year,
//       DateTime.now().month,
//       DateTime.now().day,
//       workingStartTime.hour,
//       workingStartTime.minute,
//     );

//     DateTime currentSlotEndTime;

//     while (currentSlotStartTime.isBefore(
//       DateTime(
//         DateTime.now().year,
//         DateTime.now().month,
//         DateTime.now().day,
//         workingEndTime.hour,
//         workingEndTime.minute,
//       ),
//     )) {
//       currentSlotEndTime =
//           currentSlotStartTime.add(Duration(minutes: lessonDuration));
//       if (currentSlotEndTime.isAfter(
//         DateTime(
//           DateTime.now().year,
//           DateTime.now().month,
//           DateTime.now().day,
//           workingEndTime.hour,
//           workingEndTime.minute,
//         ),
//       )) {
//         break;
//       }

//       meetings.add(Meeting(
//         eventName: "Available Slot",
//         from: currentSlotStartTime,
//         to: currentSlotEndTime,
//         background: Colors.green,
//       ));

//       currentSlotStartTime =
//           currentSlotEndTime.add(Duration(minutes: restDuration));
//     }
//   }

// //eklenen event
//   void _addMeeting(String eventName, DateTime from, DateTime to) {
//     setState(() {
//       meetings.add(
//         Meeting(
//           eventName: eventName,
//           from: from,
//           to: to,
//           background: Colors.blue,
//         ),
//       );
//     });
//   }

//   void _showAddMeetingDialog(BuildContext context, DateTime selectedDate) {
//     final TextEditingController eventNameController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Add Meeting'),
//           content: TextField(
//             controller: eventNameController,
//             decoration: const InputDecoration(
//               labelText: 'Event Name',
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 final String eventName = eventNameController.text;

//                 _addMeeting(
//                     eventName,
//                     selectedDate,
//                     selectedDate.add(Duration(
//                         minutes: widget.calendarInfo['lessonDuration'])));

//                 Navigator.of(context).pop();
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.calendarInfo['calendarName']),
//         centerTitle: true,
//       ),
//       body: SfCalendar(
//         allowedViews: [
//           //üç nokta ikonla gösterilen ve birden fazla seçenek sunan yerimiz
//           CalendarView.day,
//           CalendarView.week,
//           CalendarView.workWeek,
//           CalendarView.timelineDay,
//           CalendarView.timelineWeek,
//           CalendarView.timelineWorkWeek
//         ],
//         weekNumberStyle: const WeekNumberStyle(
//           backgroundColor: Colors.pink,
//           textStyle: TextStyle(color: Colors.white, fontSize: 15),
//         ),
//         // timeSlotViewSettings: TimeSlotViewSettings(
//         //     allDayPanelColor: Colors.yellow,
//         //     timeInterval:
//         //         Duration(minutes: widget.calendarInfo['lessonDuration']),
//         //     timeFormat: 'h:mm',
//         //     numberOfDaysInView: 3,
//         //     dateFormat: 'd',
//         //     dayFormat: 'EEE'),
//         view: CalendarView.day,
//         showNavigationArrow: true,
//         showWeekNumber: true,
//         showCurrentTimeIndicator: true,
//         controller: _controller,
//         dataSource: MeetingDataSource(meetings),
//         specialRegions: specialRegions,
//         onTap: (CalendarTapDetails details) {
//           if (details.targetElement == CalendarElement.calendarCell) {
//             final DateTime selectedDate = details.date!;
//             _showAddMeetingDialog(context, selectedDate);
//           }
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:uuid/uuid.dart';

// class Meeting {
//   Meeting({
//     required this.eventName,
//     required this.from,
//     required this.to,
//     required this.background,
//     this.isAllDay = false,
//   });

//   String eventName;
//   DateTime from;
//   DateTime to;
//   Color background;
//   bool isAllDay;
// }

// class MeetingDataSource extends CalendarDataSource {
//   MeetingDataSource(List<Meeting> meetings) {
//     appointments = meetings;
//   }

//   @override
//   DateTime getStartTime(int index) {
//     return appointments![index].from;
//   }

//   @override
//   DateTime getEndTime(int index) {
//     return appointments![index].to;
//   }

//   @override
//   String getSubject(int index) {
//     return appointments![index].eventName;
//   }

//   @override
//   Color getColor(int index) {
//     return appointments![index].background;
//   }

//   @override
//   bool isAllDay(int index) {
//     return appointments![index].isAllDay;
//   }
// }

// class CalendarPage extends StatefulWidget {
//   final Map<String, dynamic> calendarInfo;

//   const CalendarPage({Key? key, required this.calendarInfo}) : super(key: key);

//   @override
//   _CalendarPageState createState() => _CalendarPageState();
// }

// class _CalendarPageState extends State<CalendarPage> {
//   final List<Meeting> meetings = [];
//   final CalendarController _controller = CalendarController();
//   final Uuid uuid = Uuid();
//   List<TimeRegion> specialRegions = [];

//   @override
//   void initState() {
//     super.initState();
//     _initializeSpecialRegions();
//     _initializeTimeSlots();
//   }

//   void _initializeSpecialRegions() {
//     final workingStartHour = widget.calendarInfo['workingStartHour'];
//     final workingEndHour = widget.calendarInfo['workingEndHour'];
//     final blockedHours = widget.calendarInfo['blockedHours'];

//     final workingStartTime = DateFormat('HH:mm').parse(workingStartHour);
//     final workingEndTime = DateFormat('HH:mm').parse(workingEndHour);

//     final now = DateTime.now();

//     // Çalışma saatleri dışındaki zaman dilimlerini siyah yap
//     specialRegions.add(TimeRegion(
//       startTime: DateTime(now.year, now.month, now.day, 0, 0),
//       endTime: DateTime(now.year, now.month, now.day, workingStartTime.hour,
//           workingStartTime.minute),
//       color: Colors.black,
//     ));

//     specialRegions.add(TimeRegion(
//       startTime: DateTime(now.year, now.month, now.day, workingEndTime.hour,
//           workingEndTime.minute),
//       endTime: DateTime(now.year, now.month, now.day, 23, 59),
//       color: Colors.black,
//     ));

//     // Bloklanmış saatleri kırmızı yapma
//     for (var blockedHour in blockedHours) {
//       final times = blockedHour.split('-');
//       final startTime = DateFormat('HH:mm').parse(times[0]);
//       final endTime = DateFormat('HH:mm').parse(times[1]);

//       specialRegions.add(TimeRegion(
//         startTime: DateTime(
//             now.year, now.month, now.day, startTime.hour, startTime.minute),
//         endTime: DateTime(
//             now.year, now.month, now.day, endTime.hour, endTime.minute),
//         color: Colors.red,
//       ));
//     }
//   }

//   void _initializeTimeSlots() {
//     final workingStartHour = widget.calendarInfo['workingStartHour'];
//     final workingEndHour = widget.calendarInfo['workingEndHour'];
//     final lessonDuration = widget.calendarInfo['lessonDuration'];
//     final restDuration = widget.calendarInfo['restDuration'];

//     final workingStartTime = DateFormat('HH:mm').parse(workingStartHour);
//     final workingEndTime = DateFormat('HH:mm').parse(workingEndHour);

//     DateTime currentSlotStartTime = DateTime(
//       DateTime.now().year,
//       DateTime.now().month,
//       DateTime.now().day,
//       workingStartTime.hour,
//       workingStartTime.minute,
//     );

//     DateTime currentSlotEndTime;

//     while (currentSlotStartTime.isBefore(
//       DateTime(
//         DateTime.now().year,
//         DateTime.now().month,
//         DateTime.now().day,
//         workingEndTime.hour,
//         workingEndTime.minute,
//       ),
//     )) {
//       currentSlotEndTime =
//           currentSlotStartTime.add(Duration(minutes: lessonDuration));
//       if (currentSlotEndTime.isAfter(
//         DateTime(
//           DateTime.now().year,
//           DateTime.now().month,
//           DateTime.now().day,
//           workingEndTime.hour,
//           workingEndTime.minute,
//         ),
//       )) {
//         break;
//       }

//       meetings.add(Meeting(
//         eventName: "Available Slot",
//         from: currentSlotStartTime,
//         to: currentSlotEndTime,
//         background: Colors.green,
//       ));

//       currentSlotStartTime =
//           currentSlotEndTime.add(Duration(minutes: restDuration));
//     }
//   }

//   void _addMeeting(String eventName, DateTime from, DateTime to) {
//     setState(() {
//       meetings.add(
//         Meeting(
//           eventName: eventName,
//           from: from,
//           to: to,
//           background: Colors.blue,
//         ),
//       );
//     });
//   }

//   bool _isSlotAvailable(DateTime selectedDate) {
//     return meetings.any((meeting) =>
//         meeting.from == selectedDate && meeting.background == Colors.green);
//   }

//   void _showAddMeetingDialog(BuildContext context, DateTime selectedDate) {
//     final TextEditingController eventNameController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Add Meeting'),
//           content: TextField(
//             controller: eventNameController,
//             decoration: const InputDecoration(
//               labelText: 'Event Name',
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 final String eventName = eventNameController.text;

//                 _addMeeting(
//                     eventName,
//                     selectedDate,
//                     selectedDate.add(Duration(
//                         minutes: widget.calendarInfo['lessonDuration'])));

//                 Navigator.of(context).pop();
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.calendarInfo['calendarName']),
//         centerTitle: true,
//       ),
//       body: SfCalendar(
//         view: CalendarView.day,
//         controller: _controller,
//         dataSource: MeetingDataSource(meetings),
//         specialRegions: specialRegions,
//         onTap: (CalendarTapDetails details) {
//           if (details.targetElement == CalendarElement.calendarCell) {
//             final DateTime selectedDate = details.date!;

//             if (_isSlotAvailable(selectedDate)) {
//               _showAddMeetingDialog(context, selectedDate);
//             } else {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text('Cannot add meeting at this time slot'),
//                 ),
//               );
//             }
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:uuid/uuid.dart';

class Meeting {
  Meeting({
    required this.eventName,
    required this.from,
    required this.to,
    required this.background,
    this.isAllDay = false,
  });

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> meetings) {
    appointments = meetings;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class CalendarPage extends StatefulWidget {
  final Map<String, dynamic> calendarInfo;

  const CalendarPage({Key? key, required this.calendarInfo}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final List<Meeting> meetings = [];
  final CalendarController _controller = CalendarController();
  final Uuid uuid = Uuid();
  List<TimeRegion> specialRegions = [];

  @override
  void initState() {
    super.initState();
    _initializeSpecialRegions();
    _initializeTimeSlots();
  }

  void _initializeSpecialRegions() {
    final workingStartHour = widget.calendarInfo['workingStartHour'];
    final workingEndHour = widget.calendarInfo['workingEndHour'];
    final blockedHours = widget.calendarInfo['blockedHours'];

    final workingStartTime = DateFormat('HH:mm').parse(workingStartHour);
    final workingEndTime = DateFormat('HH:mm').parse(workingEndHour);

    final now = DateTime.now();

    // Çalışma saatleri dışındaki zaman dilimlerini siyah yap
    specialRegions.add(TimeRegion(
      startTime: DateTime(now.year, now.month, now.day, 0, 0),
      endTime: DateTime(now.year, now.month, now.day, workingStartTime.hour,
          workingStartTime.minute),
      color: Colors.black,
    ));

    specialRegions.add(TimeRegion(
      startTime: DateTime(now.year, now.month, now.day, workingEndTime.hour,
          workingEndTime.minute),
      endTime: DateTime(now.year, now.month, now.day, 23, 59),
      color: Colors.black,
    ));

    // Bloklanmış saatleri kırmızı yapma
    for (var blockedHour in blockedHours) {
      final times = blockedHour.split('-');
      final startTime = DateFormat('HH:mm').parse(times[0]);
      final endTime = DateFormat('HH:mm').parse(times[1]);

      specialRegions.add(TimeRegion(
        startTime: DateTime(
            now.year, now.month, now.day, startTime.hour, startTime.minute),
        endTime: DateTime(
            now.year, now.month, now.day, endTime.hour, endTime.minute),
        color: Colors.red,
      ));
    }
  }

  void _initializeTimeSlots() {
    final workingStartHour = widget.calendarInfo['workingStartHour'];
    final workingEndHour = widget.calendarInfo['workingEndHour'];
    final lessonDuration = widget.calendarInfo['lessonDuration'];
    final restDuration = widget.calendarInfo['restDuration'];

    final workingStartTime = DateFormat('HH:mm').parse(workingStartHour);
    final workingEndTime = DateFormat('HH:mm').parse(workingEndHour);

    DateTime currentSlotStartTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      workingStartTime.hour,
      workingStartTime.minute,
    );

    DateTime currentSlotEndTime;

    while (currentSlotStartTime.isBefore(
      DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        workingEndTime.hour,
        workingEndTime.minute,
      ),
    )) {
      currentSlotEndTime =
          currentSlotStartTime.add(Duration(minutes: lessonDuration));
      if (currentSlotEndTime.isAfter(
        DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          workingEndTime.hour,
          workingEndTime.minute,
        ),
      )) {
        break;
      }

      meetings.add(Meeting(
        eventName: "Empty Slot",
        from: currentSlotStartTime,
        to: currentSlotEndTime,
        background: Colors.green,
      ));

      currentSlotStartTime =
          currentSlotEndTime.add(Duration(minutes: restDuration));
    }
  }

  void _addMeeting(String eventName, DateTime from, DateTime to) {
    setState(() {
      meetings.add(
        Meeting(
          eventName: eventName,
          from: from,
          to: to,
          background: Colors.blue,
        ),
      );
    });
  }

  bool _isSlotAvailable(DateTime selectedDate) {
    return meetings.any((meeting) =>
        meeting.from == selectedDate && meeting.background == Colors.green);
  }

  void _showAddMeetingDialog(BuildContext context, DateTime selectedDate) {
    final TextEditingController eventNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Meeting'),
          content: TextField(
            controller: eventNameController,
            decoration: const InputDecoration(
              labelText: 'Event Name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final String eventName = eventNameController.text;

                _addMeeting(
                    eventName,
                    selectedDate,
                    selectedDate.add(Duration(
                        minutes: widget.calendarInfo['lessonDuration'])));

                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  ScheduleViewSettings getScheduleViewSettings() {
    return const ScheduleViewSettings(
        weekHeaderSettings: WeekHeaderSettings(
            startDateFormat: 'dd MMM ',
            endDateFormat: 'dd MMM, yy',
            height: 50,
            textAlign: TextAlign.center,
            backgroundColor: Color(0xff3528be),
            weekTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            )),
        monthHeaderSettings: MonthHeaderSettings(
            monthFormat: 'MMMM, yyyy',
            height: 70,
            textAlign: TextAlign.left,
            backgroundColor: Color(0xff3528be),
            monthTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400)),
        dayHeaderSettings: DayHeaderSettings(
            dayFormat: 'EEEE',
            width: 70,
            dayTextStyle: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Color(0xff3528be),
            ),
            dateTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff3528be),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.calendarInfo['calendarName']),
        centerTitle: true,
      ),
      body: SfCalendar(
        cellBorderColor: Colors.red,
        blackoutDatesTextStyle: TextStyle(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Colors.red,
        ),
        allowedViews: const [
          //three dots icon button
          CalendarView.day,
          CalendarView.month,
          CalendarView.week,
          CalendarView.workWeek,
          CalendarView.schedule,
          CalendarView.timelineDay,
          CalendarView.timelineWeek,
          CalendarView.timelineWorkWeek,
          CalendarView.schedule
        ],
        scheduleViewSettings: getScheduleViewSettings(),
        view: CalendarView.day,
        controller: _controller,
        dataSource: MeetingDataSource(meetings),
        specialRegions: specialRegions,
        timeSlotViewSettings: TimeSlotViewSettings(
          timelineAppointmentHeight: 70,
          timeIntervalHeight: 100,
          timeInterval:
              Duration(minutes: widget.calendarInfo['lessonDuration']),
        ),
        onTap: (CalendarTapDetails details) {
          if (details.targetElement == CalendarElement.calendarCell) {
            final DateTime selectedDate = details.date!;

            _isSlotAvailable(selectedDate)
                ? _showAddMeetingDialog(context, selectedDate)
                : ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Cannot add meeting at this time slot'),
                    ),
                  );
          }
        },
// allowedViews: [
//           //üç nokta ikonla gösterilen ve birden fazla seçenek sunan yerimiz
//           CalendarView.day,
//           CalendarView.week,
//           CalendarView.workWeek,
//           CalendarView.timelineDay,
//           CalendarView.timelineWeek,
//           CalendarView.timelineWorkWeek
//         ],
//         weekNumberStyle: const WeekNumberStyle(
//           backgroundColor: Colors.pink,
//           textStyle: TextStyle(color: Colors.white, fontSize: 15),
//         ),
//         // timeSlotViewSettings: TimeSlotViewSettings(
//         //     allDayPanelColor: Colors.yellow,
//         //     timeInterval:
//         //         Duration(minutes: widget.calendarInfo['lessonDuration']),
//         //     timeFormat: 'h:mm',
//         //     numberOfDaysInView: 3,
//         //     dateFormat: 'd',
//         //     dayFormat: 'EEE'),
//         view: CalendarView.day,
//         showNavigationArrow: true,
//         showWeekNumber: true,
//         showCurrentTimeIndicator: true,
//         controller: _controller,
//         dataSource: MeetingDataSource(meetings),
//         specialRegions: specialRegions,
//         onTap: (CalendarTapDetails details) {
//           if (details.targetElement == CalendarElement.calendarCell) {
//             final DateTime selectedDate = details.date!;
//             _showAddMeetingDialog(context, selectedDate);
//           }
//         },
      ),
    );
  }
}
