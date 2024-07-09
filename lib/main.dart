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
