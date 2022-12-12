import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:prometeo23/pages/event.dart';

// ignore: must_be_immutable
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
        'https://apiv.prometeo.in/api/EventSponsors/?event=${widget.eventId}',
      ),
    );

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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff1F2128),
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          // color: const Color(0xff64ffda),
          width: 0.5,
        ),
      ),
      child: SingleChildScrollView(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.35,
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 10,
                  right: 10,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.imageLink),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
                height: 60, // check if any overflow happens.
                // color: Color(0xff110F16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Event",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Color(0xff64ffda),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        like = !like;
                      }),
                      child: Container(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.favorite_rounded,
                          size: 40.0,
                          color: like ? Colors.pink : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
