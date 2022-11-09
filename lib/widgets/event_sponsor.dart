import 'package:flutter/material.dart';

class EventSponsor extends StatefulWidget {
  String eventSponsorLink;

  EventSponsor({required this.eventSponsorLink});

  @override
  State<EventSponsor> createState() => _EventSponsorState();
}

class _EventSponsorState extends State<EventSponsor> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          widget.eventSponsorLink,
          scale: 1.5,
        ),
      ],
    );
  }
}
