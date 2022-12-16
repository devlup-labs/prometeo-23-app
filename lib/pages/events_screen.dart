import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:prometeo23/api/fetchEvent.dart';
import 'package:prometeo23/pages/eventsPage.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';


class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(currentIndex: 1),
      backgroundColor: Colors.blueGrey,
      body: CarouselSlider(  
        slideTransform: const CubeTransform(),
        unlimitedMode: true,
        slideIndicator: CircularSlideIndicator(
          padding: const EdgeInsets.only(bottom: 10),
          currentIndicatorColor: Colors.white
        ),
        children: [
          EventsPage(eventList: informals, eventType: 'Informals',),
          EventsPage(eventList: speakers, eventType: 'Speaker Talk'),
          EventsPage(eventList: technicalEvents, eventType: 'Technical Event'),
          EventsPage(eventList: enterperneuralEvents, eventType: 'Entrepreneural Event'),
          EventsPage(eventList: exhibitions, eventType: 'Exhibitions'),
        ],
      )
    );
  }
}