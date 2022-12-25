import 'package:flutter/material.dart';
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
        const CircularParticleScreen(),
        Container(
          child: const Center(
            child: Text(
              'profile',
            ),
          ),
        ),
      ],
    );
  }
}
