import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sfcalender/calendar_page.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:uuid/uuid.dart';

class GeneralInfoPage extends StatefulWidget {
  @override
  _GeneralInfoPageState createState() => _GeneralInfoPageState();
}

class _GeneralInfoPageState extends State<GeneralInfoPage> {
  final TextEditingController calendarNameController = TextEditingController();
  final TextEditingController workingStartHourController =
      TextEditingController();
  final TextEditingController workingEndHourController =
      TextEditingController();
  final TextEditingController lessonDurationController =
      TextEditingController();
  final TextEditingController restDurationController = TextEditingController();
  final List<int> daysOff = [];
  final TextEditingController blockedHoursController = TextEditingController();
  bool isPrivate = false;

  void _submit() {
    final calendarName = calendarNameController.text;
    final workingStartHour = workingStartHourController.text;
    final workingEndHour = workingEndHourController.text;
    final lessonDuration = int.parse(lessonDurationController.text);
    final restDuration = int.parse(restDurationController.text);
    final blockedHours = blockedHoursController.text.split(',');

    final Map<String, dynamic> calendarInfo = {
      'calendarName': calendarName,
      'workingStartHour': workingStartHour,
      'workingEndHour': workingEndHour,
      'lessonDuration': lessonDuration,
      'restDuration': restDuration,
      'daysOff': daysOff,
      'isPrivate': isPrivate,
      'blockedHours': blockedHours,
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CalendarPage(calendarInfo: calendarInfo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('General Info')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: calendarNameController,
              decoration: InputDecoration(labelText: 'Calendar Name'),
            ),
            TextField(
              controller: workingStartHourController,
              decoration:
                  InputDecoration(labelText: 'Working Start Hour (HH:mm)'),
            ),
            TextField(
              controller: workingEndHourController,
              decoration:
                  InputDecoration(labelText: 'Working End Hour (HH:mm)'),
            ),
            TextField(
              controller: lessonDurationController,
              decoration:
                  InputDecoration(labelText: 'Lesson Duration (minutes)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: restDurationController,
              decoration: InputDecoration(labelText: 'Rest Duration (minutes)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: blockedHoursController,
              decoration:
                  InputDecoration(labelText: 'Blocked Hours (HH:mm-HH:mm)'),
            ),
            CheckboxListTile(
              title: Text('Private Calendar'),
              value: isPrivate,
              onChanged: (bool? value) {
                setState(() {
                  isPrivate = value!;
                });
              },
            ),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
