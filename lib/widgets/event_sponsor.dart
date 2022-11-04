import 'package:flutter/cupertino.dart';

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
                color: CupertinoColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Image.network(
          widget.eventSponsorLink,
          scale: 1.5,
        ),
      ],
    );
  }
}
