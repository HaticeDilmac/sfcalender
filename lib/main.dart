import 'package:flutter/material.dart';
import 'package:sfcalender/meeting.dart';
import 'package:sfcalender/meeting_date_source.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  return runApp(const MaterialApp(home: CalenderWidget()));
}

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
      eventName: 'Hatice Dilmac Fitness',
      from: startTime,
      to: endTime,
      background: Colors.pink,
      isAllDay: false,
    ));
    meetings.add(Meeting(
      eventName: 'Ayşe  Workout B',
      from: DateTime(today.year, today.month, today.day, 10),
      to: startTime.add(const Duration(hours: 2)),
      background: Colors.blue,
      isAllDay: false,
    ));
    meetings.add(Meeting(
      eventName: 'Ahmet Swimming',
      from: startTime,
      to: endTime,
      background: Colors.green,
      isAllDay: false,
    ));
    return meetings;
  }

  CalendarView calendarView = CalendarView.month;
  CalendarController calendarController = CalendarController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Calendar'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      calendarView = CalendarView.month;
                      calendarController.view = calendarView;
                    });
                  },
                  child: const Text('Mount View')),
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      calendarView = CalendarView.week;
                      calendarController.view = calendarView;
                    });
                  },
                  child: const Text('Week View')),
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      calendarView = CalendarView.day;
                      calendarController.view = calendarView;
                    });
                  },
                  child: const Text('Day View')),
            ],
          ),
          Expanded(
            child: SfCalendar(
              initialSelectedDate: DateTime.now(),
              controller: calendarController,
              view: CalendarView.month,
              cellBorderColor: Colors.green,
              dataSource: MeetingDataSource(_getDataSource()),
              // selectionDecoration: BoxDecoration(color: Colors.amber),
              monthViewSettings: const MonthViewSettings(
                  appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
                  showAgenda:
                      true), //haber açılım kısmını gösterir - tıklanan kısmın açıklaması
              blackoutDates: [
                DateTime.now().subtract(const Duration(hours: 48)),
                DateTime.now().subtract(const Duration(hours: 24)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
