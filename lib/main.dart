import 'package:flutter/material.dart';
import 'package:sfcalender/general_info.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

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

void main() {
  runApp(MaterialApp(home: GeneralInfoPage()));
}

// class CalendarPage extends StatefulWidget {
//   const CalendarPage({super.key});

//   @override
//   State<CalendarPage> createState() => _CalendarPageState();
// }

// class _CalendarPageState extends State<CalendarPage> {
//   final List<Meeting> meetings = [];
//   final CalendarController _controller = CalendarController();
//   final Uuid uuid = Uuid();

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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Calendar'),
//         centerTitle: true,
//       ),
//       body: SfCalendar(
//         view: CalendarView.month,
//         controller: _controller,
//         dataSource: MeetingDataSource(meetings),
//         onTap: (CalendarTapDetails details) {
//           if (details.targetElement == CalendarElement.calendarCell) {
//             final DateTime selectedDate = details.date!;
//             _showAddMeetingDialog(context, selectedDate);
//           }
//         },
//         blackoutDates: [
//           DateTime.now().subtract(const Duration(days: 1)), // Dün
//           DateTime.now().add(const Duration(days: 1)), // Yarın
//         ],
//       ),
//     );
//   }

//   void _showAddMeetingDialog(BuildContext context, DateTime selectedDate) {
//     final TextEditingController eventNameController = TextEditingController();
//     final TextEditingController durationController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Add Meeting'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: eventNameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Event Name',
//                 ),
//               ),
//               TextField(
//                 controller: durationController,
//                 decoration: const InputDecoration(
//                   labelText: 'Duration in hours',
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//             ],
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
//                 final int duration = int.tryParse(durationController.text) ?? 1;
//                 final DateTime startTime = selectedDate;
//                 final DateTime endTime =
//                     startTime.add(Duration(hours: duration));

//                 _addMeeting(eventName, startTime, endTime);

//                 Navigator.of(context).pop();
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:syncfusion_flutter_calendar/calendar.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Calendar App',
// //       home: const BlockSettingsPage(),
// //     );
// //   }
// // }

// // class BlockSettingsPage extends StatefulWidget {
// //   const BlockSettingsPage({super.key});

// //   @override
// //   State<BlockSettingsPage> createState() => _BlockSettingsPageState();
// // }

// // class _BlockSettingsPageState extends State<BlockSettingsPage> {
// //   final List<int> _blockedHours = [];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Block Settings"),
// //         centerTitle: true,
// //       ),
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         crossAxisAlignment: CrossAxisAlignment.center,
// //         children: [
// //           const Text(
// //             "Select hours to block:",
// //             style: TextStyle(fontSize: 18),
// //           ),
// //           const SizedBox(height: 20),
// //           ...List.generate(10, (index) {
// //             //selected block hours
// //             return CheckboxListTile(
// //               title: Text("Hour: $index"),
// //               value: _blockedHours.contains(index),
// //               onChanged: (bool? isSelected) {
// //                 setState(() {
// //                   if (isSelected == true) {
// //                     _blockedHours.add(index);
// //                   } else {
// //                     _blockedHours.remove(index);
// //                   }
// //                 });
// //               },
// //             );
// //           }),
// //           const SizedBox(height: 20),
// //           ElevatedButton(
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(
// //                   builder: (context) =>
// //                       CalendarWidget(blockedHours: _blockedHours),
// //                 ),
// //               );
// //             },
// //             child: const Text("Go to Calendar"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class CalendarWidget extends StatefulWidget {
// //   final List<int> blockedHours;

// //   const CalendarWidget({required this.blockedHours, super.key});

// //   @override
// //   State<CalendarWidget> createState() => _CalendarWidgetState();
// // }

// // class _CalendarWidgetState extends State<CalendarWidget> {
// //   final CalendarController _calendarController = CalendarController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Calendar"),
// //         centerTitle: true,
// //       ),
// //       body: SfCalendar(
// //         view: CalendarView.day,
// //         controller: _calendarController,
// //         onTap: (CalendarTapDetails details) {
// //           final DateTime selectedTime = details.date!;
// //           final int selectedHour = selectedTime.hour;

// //           // Eğer bloklanmış bir saate tıklanırsa
// //           if (widget.blockedHours.contains(selectedHour)) {
// //             _showBlockWarning(context);
// //           } else {
// //             // Bloklanmamış saatlerde etkinlik ekleyebilir
// //             _showAddEventDialog(context, selectedTime);
// //           }
// //         },
// //       ),
// //     );
// //   }

// //   void _showBlockWarning(BuildContext context) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: const Text("Warning"),
// //           content:
// //               const Text("This time slot is blocked. You cannot add events."),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //               child: const Text("OK"),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   void _showAddEventDialog(BuildContext context, DateTime selectedTime) {
// //     final TextEditingController eventNameController = TextEditingController();

// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: const Text("Add Event"),
// //           content: TextField(
// //             controller: eventNameController,
// //             decoration: const InputDecoration(
// //               labelText: "Event Name",
// //             ),
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //               child: const Text("Cancel"),
// //             ),
// //             TextButton(
// //               onPressed: () {
// //                 final String eventName = eventNameController.text;
// //                 // Burada etkinlik ekleme işlemini gerçekleştirin
// //                 Navigator.of(context).pop();
// //               },
// //               child: const Text("Add"),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }

















// // // import 'package:flutter/material.dart';
// // // import 'package:syncfusion_flutter_calendar/calendar.dart';

// // // void main() {
// // //   runApp(const MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   const MyApp({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Slot-based Calendar',
// //       home: const BlockSettingsPage(),
// //     );
// //   }
// // }

// // class BlockSettingsPage extends StatefulWidget {
// //   const BlockSettingsPage({super.key});

// //   @override
// //   State<BlockSettingsPage> createState() => _BlockSettingsPageState();
// // }

// // class _BlockSettingsPageState extends State<BlockSettingsPage> {
// //   final List<int> blockedHours = [];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Block Settings"),
// //         centerTitle: true,
// //       ),
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         crossAxisAlignment: CrossAxisAlignment.center,
// //         children: [
// //           const Text(
// //             "Select hours to block:",
// //             style: TextStyle(fontSize: 18),
// //           ),
// //           const SizedBox(height: 20),
// //           ...List.generate(10, (index) {
// //             return CheckboxListTile(
// //               title: Text("Hour: $index"),
// //               value: blockedHours.contains(index),
// //               onChanged: (bool? isSelected) {
// //                 setState(() {
// //                   if (isSelected == true) {
// //                     blockedHours.add(index);
// //                   } else {
// //                     blockedHours.remove(index);
// //                   }
// //                 });
// //               },
// //             );
// //           }),
// //           const SizedBox(height: 20),
// //           ElevatedButton(
// //             onPressed: () {
// //               final List<Map<String, int>> slots =
// //                   calculateWorkSlots(blockedHours);

// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(
// //                   builder: (context) => CalendarWidget(
// //                     slots: slots,
// //                   ),
// //                 ),
// //               );
// //             },
// //             child: const Text("Go to Calendar"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   List<Map<String, int>> calculateWorkSlots(List<int> blockedHours) {
// //     List<Map<String, int>> workSlots = [];
// //     int startHour = 0;

// //     while (startHour < 24) {
// //       if (!blockedHours.contains(startHour)) {
// //         int endHour = startHour;

// //         while (endHour < 24 && !blockedHours.contains(endHour)) {
// //           endHour++;
// //         }

// //         workSlots.add({"start": startHour, "end": endHour - 1});
// //         startHour = endHour;
// //       } else {
// //         startHour++;
// //       }
// //     }

// //     return workSlots;
// //   }
// // }

// // class CalendarWidget extends StatelessWidget {
// //   final List<Map<String, int>> slots;

// //   const CalendarWidget({required this.slots, super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Calendar"),
// //         centerTitle: true,
// //       ),
// //       body: SfCalendar(
// //         view: CalendarView.day,
// //         onTap: (CalendarTapDetails details) {
// //           final int selectedHour = details.date!.hour;

// //           bool isBlocked = slots.every((slot) =>
// //               selectedHour < slot["start"]! || selectedHour > slot["end"]!);

// //           if (isBlocked) {
// //             _showBlockWarning(context);
// //           } else {
// //             _showAddEventDialog(context);
// //           }
// //         },
// //       ),
// //     );
// //   }

// //   void _showBlockWarning(BuildContext context) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: const Text("Blocked"),
// //           content: const Text("This slot is blocked. You cannot add events."),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //               child: const Text("OK"),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   void _showAddEventDialog(BuildContext context) {
// //     final TextEditingController eventNameController = TextEditingController();

// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: const Text("Add Event"),
// //           content: TextField(
// //             controller: eventNameController,
// //             decoration: const InputDecoration(
// //               labelText: "Event Name",
// //             ),
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //               child: const Text("Cancel"),
// //             ),
// //             TextButton(
// //               onPressed: () {
// //                 final String eventName = eventNameController.text;
// //                 Navigator.of(context).pop();
// //               },
// //               child: const Text("Add"),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }
