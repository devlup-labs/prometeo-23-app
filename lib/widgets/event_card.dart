import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  String eventName;
  String eventDate;
  String eventTime;
  String ImageLink;

  EventCard({
    required this.eventName,
    required this.eventDate,
    required this.eventTime,
    required this.ImageLink,
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
            widget.ImageLink,
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
                  Icons.arrow_back_ios,
                  color: Colors.orange,
                  size: 24,
                ),
              ),
            ),
          ),
          // Positioned.fill(
          //   child: Align(
          //     alignment: Alignment.bottomLeft,
          //     child: Container(
          //       padding: EdgeInsets.only(
          //         left: MediaQuery.of(context).size.width * 0.05,
          //         right: MediaQuery.of(context).size.width * 0.1,
          //         // bottom: MediaQuery.of(context).size.height * 0.02,
          //       ),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Container(
          //             width: size.width,
          //             decoration: BoxDecoration(
          //               color: Colors.black.withOpacity(0.5),
          //             ),
          //             child: FittedBox(
          //               fit: BoxFit.fitWidth,
          //               child: Text(
          //                 widget.eventName,
          //                 style: const TextStyle(
          //                   fontSize: 30,
          //                   color: Colors.orange,
          //                   fontWeight: FontWeight.w600,
          //                 ),
          //               ),
          //             ),
          //           ),
          //           const SizedBox(
          //             height: 15,
          //           ),
          //           // Row(
          //           //   crossAxisAlignment: CrossAxisAlignment.start,
          //           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           //   children: [
          //           //     Row(
          //           //       children: [
          //           //         Icon(
          //           //           Icons.currency_rupee,
          //           //           color: Colors.orange,
          //           //           size: 18,
          //           //         ),
          //           //         const SizedBox(
          //           //           width: 5,
          //           //         ),
          //           //         FittedBox(
          //           //           fit: BoxFit.fitWidth,
          //           //           child: Text(
          //           //             "Prizes Worth " + widget.eventDate,
          //           //             style: const TextStyle(
          //           //               color: Colors.orange,
          //           //               fontSize: 14,
          //           //             ),
          //           //           ),
          //           //         ),
          //           //       ],
          //           //     ),
          //           //     Row(
          //           //       children: [
          //           //         Icon(
          //           //           Icons.alarm,
          //           //           color: Color(0xff64ffda),
          //           //           size: 18,
          //           //         ),
          //           //         const SizedBox(
          //           //           width: 5,
          //           //         ),
          //           //         FittedBox(
          //           //           fit: BoxFit.fitWidth,
          //           //           child: Text(
          //           //             widget.eventTime,
          //           //             style: const TextStyle(
          //           //               color: Colors.orange,
          //           //               fontSize: 14,
          //           //             ),
          //           //           ),
          //           //         ),
          //           //       ],
          //           //     ),
          //           //   ],
          //           // )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
