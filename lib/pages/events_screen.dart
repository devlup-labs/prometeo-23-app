import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:prometeo23/api/fetchEvents.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/pages/entrepreneural_events_screen.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: CarouselSlider(  
        slideTransform: const CubeTransform(),
        unlimitedMode: true,
        slideIndicator: CircularSlideIndicator(
          padding: const EdgeInsets.only(bottom: 10),
          currentIndicatorColor: Colors.white
        ),
        children: [
          EventsPage(eventList: informalEventList, eventType: 'Informals',),
          EventsPage(eventList: speakersList, eventType: 'Speaker Talk'),
          EventsPage(eventList: technicalEventsList, eventType: 'Technical Event'),
          EventsPage(eventList: entrepreneuralEventsList, eventType: 'Entrepreneural Event'),
        ],
      )
    );
  }
}