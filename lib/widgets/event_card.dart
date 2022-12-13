import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  String eventName;
  String eventDate;
  String eventTime;
  String ImageLink;

  EventCard({
    required this.eventName,
    required this.eventDate,
    required this.eventTime,
    required this.ImageLink,
  });

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Image.network(
            widget.ImageLink,
          ),
          Container(
            padding: EdgeInsets.only(
              top: size.height * 0.05,
            ),
            child: Container(
              padding: EdgeInsets.only(
                left: size.width * 0.05,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.orange,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
