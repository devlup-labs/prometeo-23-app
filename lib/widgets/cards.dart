import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/pages/event.dart';

class Cards extends StatefulWidget {
  String eventId;
  String title;
  String prize;
  String imageLink;
  String description;

  Cards({
    required this.eventId,
    required this.imageLink,
    required this.prize,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  List<String> sponsorLinks = [];
  bool isLoading = true;
  void fetchSponsorLink() async {
    final response = await http.get(
      Uri.parse(
        'https://apiv.prometeo.in/api/EventSponsors/?event=' + widget.eventId,
      ),
    );
    print(Uri.parse(
        'https://apiv.prometeo.in/api/EventSponsors/?event=' + widget.eventId));

    print(response);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var list = json.decode(response.body) as List;

      //iterate over json and create a list
      for (var i = 0; i < list.length; i++) {
        String sponsorLink =
            'https://apiv.prometeo.in/' + list[i]['image'].substring(19);
        sponsorLinks.add(sponsorLink);
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

    setState(() {
      isLoading = false;
    });
  }

  bool like = false;
  @override
  void initState() {
    super.initState();
    fetchSponsorLink();
  }

  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(
            context,
            rootNavigator: false,
          ).push(
            MaterialPageRoute(
              builder: (context) => Event(
                eventName: widget.title,
                eventDate: widget.prize,
                eventTime: "4pm - 12pm",
                eventDescription: widget.description,
                imageLink: widget.imageLink,
                sponsorLink: sponsorLinks,
              ),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 400,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            // color: CupertinoColors.activeBlue
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(widget.imageLink),
            ),
          ),
          child: Stack(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.orange,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.currency_rupee,
                          color: Colors.orange,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "Prizes worth: " + widget.prize,
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: CupertinoColors.systemGrey,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: CupertinoButton(
                      onPressed: () {
                        setState(() {
                          like = !like;
                        });
                        print(like);
                      },
                      child: Icon(
                        CupertinoIcons.heart_fill,
                        color: like == true
                            ? CupertinoColors.systemPink
                            : CupertinoColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
