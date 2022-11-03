import 'package:flutter/cupertino.dart';
import 'package:prometeo23/Background/bg.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircularParticleScreen(),
        Container(
          child: Center(
            child: Text(
              'profile',
            ),
          ),
        ),
      ],
    );
  }
}
