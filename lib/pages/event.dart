import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/pages/bottom_navigation_pages/home_page.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';
import 'package:prometeo23/widgets/event_card.dart';
import 'package:prometeo23/widgets/event_description.dart';
import 'package:prometeo23/widgets/event_sponsor.dart';
import 'package:prometeo23/widgets/prices.dart';
import 'package:prometeo23/widgets/register_button.dart';
import 'package:prometeo23/widgets/rule_book.dart';
import 'package:prometeo23/widgets/unstop_registration.dart';

class Event extends StatefulWidget {
  String eventName;
  String eventDate;
  String eventTime;
  String eventDescription;
  String imageLink;
  bool isSpeaker;
  List<String> sponsorLink;
  String ruleBookLink;
  String unstopLink;
  String eventLocation;
  String eventPrize;

  Event({
    required this.eventName,
    required this.eventDate,
    required this.eventTime,
    required this.eventDescription,
    required this.imageLink,
    required this.sponsorLink,
    required this.isSpeaker,
    required this.ruleBookLink,
    required this.unstopLink,
    required this.eventLocation,
    required this.eventPrize,
  });

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  bool isRuleBook = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      isRuleBook = (widget.ruleBookLink != "https://apiv.prometeo.in");
    });
  }

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
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
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Text(
                    widget.eventName,
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                !widget.isSpeaker ? PrizesWorth(widget: widget) : Container(),
                const SizedBox(
                  height: 10,
                ),
                EventDescription(
                  eventDescription: widget.eventDescription,
                ),
                (!widget.isSpeaker && isRuleBook)
                    ? RuleBookWidget(
                        ruleBookLink: widget.ruleBookLink,
                      )
                    : Container(),
                (!widget.isSpeaker && isRuleBook)
                    ? UnstopRegistration(
                        unstopLink: widget.unstopLink,
                      )
                    : Container(),
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
        currentIndex: -1,
      ),
    );
  }
}

class PrizesWorth extends StatelessWidget {
  const PrizesWorth({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final Event widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Text(
        widget.eventPrize,
        style: GoogleFonts.poppins(
          fontSize: 20,
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
