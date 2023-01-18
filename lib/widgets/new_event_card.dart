import 'package:flutter/material.dart';
import 'package:prometeo23/pages/event.dart';

class NewEventCard extends StatelessWidget {
  final String imageLink;
  final String eventName;
  final String eventPrize;
  final String eventDate;
  final String eventDescription;
  final bool isSpeaker;
  final String ruleBookLink;
  final String unStopLink;
  final String eventLocation;
  final List<String> sponsorLinks;


  const NewEventCard(
      {required this.imageLink,
      required this.eventName,
      required this.eventDate,
      required this.eventPrize,
      required this.eventDescription,
      required this.isSpeaker,
      required this.ruleBookLink,
      required this.unStopLink,
      required this.eventLocation,
      required this.sponsorLinks,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        image: DecorationImage(
          image: NetworkImage(imageLink),
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 30,
            child: Container(
              color: Colors.blue.withOpacity(0.4),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Center(
                child: Text(
                  eventName,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(
              bottom: 10,
            ),
            child: Column(
              children: [
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        (eventPrize != "NA")
                            ? Text(
                                eventPrize,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Container(),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.calendar_month_rounded,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              eventDate,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        TextButton(
                          onPressed: () {
                            Navigator.of(
                              context,
                              rootNavigator: false,
                            ).push(
                              MaterialPageRoute(
                                builder: (context) => Event(
                                  eventName: eventName,
                                  eventDate: eventDate,
                                  eventTime: "4pm - 12pm",
                                  eventDescription: eventDescription,
                                  imageLink: imageLink,
                                  sponsorLink: sponsorLinks,
                                  isSpeaker: isSpeaker,
                                  ruleBookLink: ruleBookLink,
                                  unstopLink: unStopLink,
                                  eventLocation: eventLocation,
                                  eventPrize: eventPrize,
                                ),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff003959),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'Read More',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
