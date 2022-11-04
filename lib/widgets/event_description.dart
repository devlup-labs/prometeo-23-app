import 'package:flutter/cupertino.dart';
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
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(
              fontSize: 20,
              color: CupertinoColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ReadMoreText(
            widget.eventDescription,
            trimLines: 2,
            colorClickableText: Color(0xff64ffda),
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Read more',
            trimExpandedText: ' Read less',
            moreStyle: TextStyle(
              fontSize: 12,
              color: Color(0xff64ffda),
            ),
            style: TextStyle(
              fontSize: 16,
              color: CupertinoColors.white,
            ),
            lessStyle: TextStyle(
              fontSize: 12,
              color: Color(0xff64ffda),
            ),
          ),
        ],
      ),
    );
  }
}
