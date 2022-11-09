import 'package:flutter/material.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';
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
  String imageLink;
  List<String> sponsorLink;

  Event({
    required this.eventName,
    required this.eventDate,
    required this.eventTime,
    required this.eventDescription,
    required this.imageLink,
    required this.sponsorLink,
  });

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff110F16),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            child: Column(
              children: [
                EventCard(
                  eventName: widget.eventName,
                  eventDate: widget.eventDate,
                  eventTime: widget.eventTime,
                  ImageLink: widget.imageLink,
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
                Container(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sponsored By",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                for (var i = 0; i < widget.sponsorLink.length; i++)
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: EventSponsor(
                      eventSponsorLink: widget.sponsorLink[i],
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 0,
      ),
    );
  }
}
