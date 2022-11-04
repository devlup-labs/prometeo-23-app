import 'package:flutter/cupertino.dart';

class EventCard extends StatefulWidget {
  String eventName;
  String eventDate;
  String eventTime;

  EventCard({
    required this.eventName,
    required this.eventDate,
    required this.eventTime,
  });

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Image.network(
            "https://i.postimg.cc/sgBFfbkY/audience-on-music-notes-background-0610-min.jpg",
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
            ),
            child: Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  CupertinoIcons.arrow_left,
                  color: CupertinoColors.white,
                  size: 24,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.1,
                  bottom: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        widget.eventName,
                        style: const TextStyle(
                          fontSize: 30,
                          color: CupertinoColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.calendar,
                              color: Color(0xff64ffda),
                              size: 18,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                widget.eventDate,
                                style: const TextStyle(
                                  color: CupertinoColors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.clock,
                              color: Color(0xff64ffda),
                              size: 18,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                widget.eventTime,
                                style: const TextStyle(
                                  color: CupertinoColors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
