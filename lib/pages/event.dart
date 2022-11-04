import 'package:flutter/material.dart';
import 'package:prometeo23/widgets/event_card.dart';
import 'package:prometeo23/widgets/event_description.dart';
import 'package:prometeo23/widgets/event_sponsor.dart';
import 'package:prometeo23/widgets/prices.dart';
import 'package:prometeo23/widgets/register_button.dart';

class Event extends StatefulWidget {
  String eventName;
  String eventDate;
  String eventTime;
  String eventDescription;

  Event({
    required this.eventName,
    required this.eventDate,
    required this.eventTime,
    required this.eventDescription,
  });

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Color(0xff110F16),
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            child: Column(
              children: [
                EventCard(
                  eventName: widget.eventName,
                  eventDate: widget.eventDate,
                  eventTime: widget.eventTime,
                ),
                const SizedBox(
                  height: 30,
                ),
                EventDescription(
                  eventDescription: widget.eventDescription,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Text(
                    "Prices Worth",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Price(
                  firstPrice: "INR: 30K",
                  secondPrice: "INR: 10K",
                  thirdPrice: "INR: 5K",
                ),
                const SizedBox(
                  height: 30,
                ),
                EventSponsor(
                  eventSponsorLink:
                      "https://i.postimg.cc/bvGfT4vm/gfg-logo-removebg-preview.png",
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
