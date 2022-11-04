import 'package:flutter/cupertino.dart';
import 'package:prometeo23/widgets/event_card.dart';
import 'package:prometeo23/widgets/event_description.dart';
import 'package:prometeo23/widgets/event_sponsor.dart';
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
    return Container(
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
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height / 14,
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                decoration: BoxDecoration(
                  color: Color(0xff64ffda),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Icon(
                            CupertinoIcons.location_north_line_fill,
                            color: CupertinoColors.black,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "10K",
                            style: TextStyle(
                              fontSize: 14,
                              color: CupertinoColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            CupertinoIcons.location_north_line_fill,
                            color: CupertinoColors.black,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "30K",
                            style: TextStyle(
                              fontSize: 14,
                              color: CupertinoColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            CupertinoIcons.location_north_line_fill,
                            color: CupertinoColors.black,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "5K",
                            style: TextStyle(
                              fontSize: 14,
                              color: CupertinoColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
              // RegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}
