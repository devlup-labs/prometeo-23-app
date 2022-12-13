import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: CarouselSlider(  
        slideTransform: const CubeTransform(),
        unlimitedMode: true,
        slideIndicator: CircularSlideIndicator(
          padding: const EdgeInsets.only(bottom: 10)
        ),
        children: [
          Container(
            color: Colors.deepPurple[300]
          ),
          Container(
            color: Colors.deepPurple[300]
          ),
          Container(
            color: Colors.deepPurple[300]
          ),
        ],
      )
    );
  }
}