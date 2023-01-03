import 'package:flutter/material.dart';
import 'package:prometeo23/constants.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widgets/schedule_tile.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime _selectedDay =  DateTime.utc(2023, 1, 20);
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: bgColor,  
      body: SafeArea(
        child: Column(
          children: [
            TableCalendar(  
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.utc(2023, 1, 20),
                calendarFormat: CalendarFormat.week,
                startingDayOfWeek: StartingDayOfWeek.friday,
                headerStyle:const HeaderStyle(   
                  formatButtonVisible: false,
                  titleCentered: true,
                  formatButtonShowsNext: false,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )
                ),
                calendarStyle: const CalendarStyle(    
                  weekendTextStyle: TextStyle(  
                    color: Colors.white
                  ) ,
                  defaultTextStyle: TextStyle(  
                    color: Colors.white,
                  )     
                ),
                onDaySelected: (selectedDay, focusedDay) => 
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  }),
                selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
            ),
            Expanded(
              child: ListView.builder( 
                itemCount: 3,  
                itemBuilder: (context, builder) => const ScheduleTile(),
              ),
            )
          ],
        ),
      )
    );
  }
}