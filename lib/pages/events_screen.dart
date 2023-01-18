import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:prometeo23/pages/events_page.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';
import '../api/fetchEvents.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: CarouselSlider(
        slideTransform: const CubeTransform(),
        unlimitedMode: true,
        slideIndicator: CircularSlideIndicator(
          padding: const EdgeInsets.only(bottom: 10),
          currentIndicatorColor: Colors.amberAccent,
          indicatorBackgroundColor: Colors.white,
        ),
        children: [
          EventsPage(
            eventList: exhibitions,
            eventType: 'Exhibitions',
          ),
          EventsPage(
            eventList: speakers,
            eventType: 'Speaker Talk',
          ),
          EventsPage(
            eventList: technicalEvents,
            eventType: 'Technical Event',
          ),
          EventsPage(
            eventList: entrepreneurialEvents,
            eventType: 'Entrepreneurial Event',
          ),
          EventsPage(
            eventList: informals,
            eventType: 'Informals',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(currentIndex: 1),
    );
  }
}
