import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/pages/bottom_navigation_pages/home_page.dart';
import 'package:prometeo23/widgets/app_bar.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';
import 'package:prometeo23/widgets/event_description.dart';
import 'package:prometeo23/widgets/event_sponsor.dart';
import 'package:prometeo23/widgets/nav_drawer.dart';
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: bgColor,
      drawer: NavDrawer(),
      body: Container(
        padding: EdgeInsets.only(
          left: size.width * 0.05,
          right: size.width * 0.05,
        ),
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.imageLink,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    widget.eventName,
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                PrizeAndDate(size: size, widget: widget),
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
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sponsored By",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
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

class PrizeAndDate extends StatelessWidget {
  const PrizeAndDate({
    Key? key,
    required this.size,
    required this.widget,
  }) : super(key: key);

  final Size size;
  final Event widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        !widget.isSpeaker
            ? Container(
                height: 50,
                width: size.width * 0.4,
                decoration: BoxDecoration(
                  color: Color(0xff496B8B),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Center(
                    child: AutoSizeText(
                      widget.eventPrize,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
              )
            : Container(),
        !widget.isSpeaker ? Spacer() : Container(),
        Container(
          height: 50,
          width: size.width * 0.4,
          decoration: BoxDecoration(
            color: Color(0xff496B8B),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Center(
              child: AutoSizeText(
                widget.eventDate,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
              ),
            ),
          ),
        ),
      ],
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
