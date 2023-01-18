import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class EventDescription extends StatefulWidget {
  String eventDescription;

  EventDescription({required this.eventDescription});

  @override
  State<EventDescription> createState() => _EventDescriptionState();
}

class _EventDescriptionState extends State<EventDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReadMoreText(
            textAlign: TextAlign.justify,
            widget.eventDescription,
            trimLines: 4,
            colorClickableText: const Color(0xff64ffda),
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Read more',
            trimExpandedText: ' Read less',
            moreStyle: GoogleFonts.poppins(
              fontSize: 12,
              color: const Color(0xff64ffda),
            ),
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white,
            ),
            lessStyle: GoogleFonts.poppins(
              fontSize: 12,
              color: const Color(0xff64ffda),
            ),
          ),
        ],
      ),
    );
  }
}
