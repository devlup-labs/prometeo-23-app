import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime _selectedDay =  DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      body: SafeArea(
        child: TableCalendar(  
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            calendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.friday,
            onDaySelected: (selectedDay, focusedDay) => 
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              }),
            selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
        ),
      )
    );
  }
}