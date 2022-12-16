import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prometeo23/models/event.dart';
import 'package:prometeo23/widgets/cards.dart';

List<Cards> TechnicalCards = [];

List<Cards> EntrepreneurialCards = [];

List<Cards> Exhibition = [];

List<Cards> Speakers = [];

List<Cards> LiveEvents = [];

List SliderCards = [];

List<Event> technicalEventsList = [];
List<Event> entrepreneuralEventsList = [];
List<Event> speakersList = [];
List<Event> exhibitions = [];
List<Event> workshops = [];
List<Event> informalEventList = [];


void fetchEvents() async {
  final response =
      await http.get(Uri.parse('https://apiv.prometeo.in/api/events/'));

  if (response.statusCode == 200) {
    var list = json.decode(response.body) as List;
    for (var i = 0; i < list.length; i++) {
      String imageLink =
          "https://apiv.prometeo.in" + list[i]['image'].substring(19);
      String ruleBookLink = "https://apiv.prometeo.in" +
          ((list[i]['rulebook'] != null)
              ? list[i]['rulebook'].substring(19)
              : "");
      if (list[i]['registration_open'] == true) {
        LiveEvents.add(
          Cards(
            eventId: list[i]['id'].toString(),
            title: list[i]['name'],
            prize: list[i]['prize'],
            imageLink: imageLink,
            description: list[i]['description'],
            isSpeaker: (list[i]['type'] == 'talk'),
            eventType: list[i]['type'],
            ruleBookLink: ruleBookLink,
            unstopLink: list[i]["external_link"],
            eventLocation: list[i]["venue"],
            eventDate: list[i]["date"],
          ),
        );
      }
      if (list[i]['type'] == 'technical') {
        TechnicalCards.add(
          Cards(
            eventId: list[i]['id'].toString(),
            title: list[i]['name'],
            prize: list[i]['prize'],
            imageLink: imageLink,
            description: list[i]['description'],
            isSpeaker: false,
            eventType: "Technical Event",
            ruleBookLink: ruleBookLink,
            unstopLink: list[i]["external_link"],
            eventLocation: list[i]["venue"],
            eventDate: list[i]["date"],
          ),
        );

        technicalEventsList.add(Event(
            name: list[i]['name'],
            image: imageLink,
            description: list[i]['description'],
            prizeMoney: list[i]['prize'],
            date: list[i]['date'],
            isSpeaker: false,
            unstopLink: list[i]['external_link'],
            eventLocation: list[i]['eventLocation'],
            eventType: 'Technical Event',
            rulebookLink: ruleBookLink));

        print(technicalEventsList);
      } else if (list[i]['type'] == 'entrepreneurial') {
        EntrepreneurialCards.add(
          Cards(
            eventId: list[i]['id'].toString(),
            title: list[i]['name'],
            prize: list[i]['prize'],
            imageLink: imageLink,
            description: list[i]['description'],
            isSpeaker: false,
            eventType: "Entrepreneurial Event",
            ruleBookLink: ruleBookLink,
            unstopLink: list[i]["external_link"],
            eventLocation: list[i]["venue"],
            eventDate: list[i]["date"],
          ),
        );
        if (list[i]['type'] == 'exhibition') {
          Exhibition.add(
            Cards(
              eventId: list[i]['id'].toString(),
              title: list[i]['name'],
              prize: list[i]['prize'],
              imageLink: imageLink,
              description: list[i]['description'],
              isSpeaker: false,
              eventType: "Exhibition",
              ruleBookLink: ruleBookLink,
              unstopLink: list[i]["external_link"],
              eventLocation: list[i]["venue"],
              eventDate: list[i]["date"],
            ),
          );
        } else if (list[i]['type'] == 'talk') {
          Speakers.add(
            Cards(
              eventId: list[i]['id'].toString(),
              title: list[i]['name'],
              prize: list[i]['prize'],
              imageLink: imageLink,
              description: list[i]['description'],
              isSpeaker: true,
              eventType: "Talk Session",
              ruleBookLink: ruleBookLink,
              unstopLink: list[i]["external_link"],
              eventLocation: list[i]["venue"],
              eventDate: list[i]["date"],
            ),
          );

          speakersList.add(Event(
              name: list[i]['name'],
              image: imageLink,
              description: list[i]['description'],
              prizeMoney: list[i]['prize'],
              date: list[i]['date'],
              isSpeaker: false,
              unstopLink: list[i]['external_link'],
              eventLocation: list[i]['eventLocation'],
              eventType: 'Talk',
              rulebookLink: ruleBookLink));
        }
      }
    }
  }
}
