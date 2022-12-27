import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/pages/event.dart';

// ignore: must_be_immutable
class Cards extends StatefulWidget {
  String eventId;
  String title;
  String prize;
  String imageLink;
  String description;
  String eventType;
  String ruleBookLink;
  bool isSpeaker;
  String unstopLink;
  String eventLocation;
  String eventDate;
  List<String> sponsorLinks;

  Cards({
    required this.eventId,
    required this.imageLink,
    required this.prize,
    required this.title,
    required this.description,
    required this.isSpeaker,
    required this.eventType,
    required this.ruleBookLink,
    required this.unstopLink,
    required this.eventLocation,
    required this.eventDate,
    required this.sponsorLinks,
    super.key,
  });

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: sliderCardColor,
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          width: 0.5,
        ),
      ),
      child: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            Navigator.of(
              context,
              rootNavigator: false,
            ).push(
              MaterialPageRoute(
                builder: (context) => Event(
                  eventName: widget.title,
                  eventDate: widget.eventDate,
                  eventTime: "4pm - 12pm",
                  eventDescription: widget.description,
                  imageLink: widget.imageLink,
                  sponsorLink: widget.sponsorLinks,
                  isSpeaker: widget.isSpeaker,
                  ruleBookLink: widget.ruleBookLink,
                  unstopLink: widget.unstopLink,
                  eventLocation: widget.eventLocation,
                  eventPrize: widget.prize,
                ),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.35,
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 10,
                  right: 10,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.imageLink),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
                height: 60, // check if any overflow happens.
                // color: Color(0xff110F16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.eventType,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        like = !like;
                      }),
                      child: Container(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.favorite_rounded,
                          size: 40.0,
                          color: like ? Colors.pink : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
