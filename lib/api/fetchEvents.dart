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

List<EventDetail> technicalEvents = [];
List<EventDetail> entrepreneurialEvents = [];
List<EventDetail> speakers = [];
List<EventDetail> exhibitions = [];
List<EventDetail> informals = [];

void fetchEvents() async {
  var response = await http.get(Uri.https('apiv.prometeo.in', '/api/events/'));

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body) as List;

    for (var event in jsonResponse) {
      String imageLink =
          "https://apiv.prometeo.in/${event['image'].substring(19)}";
      Cards eventCard = Cards(
        eventId: event['id'].toString(),
        title: event['name'],
        prize: event['prize'] ?? ' ',
        imageLink: imageLink,
        description: event['description'] ?? ' ',
        isSpeaker: (event['type'] == 'talk'),
        eventType: event['type'],
        ruleBookLink: event['rulebook_link'] ?? '',
        unstopLink: event["external_link"] ?? ' ',
        eventLocation: event["venue"] ?? '',
        eventDate: event["date"] ?? '',
      );
      EventDetail eventDetail = EventDetail(
          name: event['name'],
          image: imageLink,
          description: event['description'] ?? '',
          prizeMoney: event['prize'] ?? 'NA',
          date: event['date'] ?? '',
          isSpeaker: event['isSpeaker'] ?? false,
          unstopLink: event['external_link'] ?? '',
          eventLocation: event['venue'] ?? '',
          eventType: event['type'],
          rulebookLink: event['rulebook_link'] ?? '');

      if (event['registration_open'] == true) {
        LiveEvents.add(eventCard);
      }
      if (event['type'] == 'technical') {
        TechnicalCards.add(eventCard);
        technicalEvents.add(eventDetail);
      } else if (event['type'] == 'entrepreneurial') {
        EntrepreneurialCards.add(eventCard);
        entrepreneurialEvents.add(eventDetail);
      } else if (event['type'] == 'talk') {
        Speakers.add(eventCard);
        speakers.add(eventDetail);
      } else if (event['type'] == 'exhibition') {
        Exhibition.add(eventCard);
        exhibitions.add(eventDetail);
      } else if (event['type'] == 'informal') {
        informals.add(eventDetail);
      }
    }
  }

  // make every list unique
  TechnicalCards = TechnicalCards.toSet().toList();
  EntrepreneurialCards = EntrepreneurialCards.toSet().toList();
  Exhibition = Exhibition.toSet().toList();
  Speakers = Speakers.toSet().toList();
  LiveEvents = LiveEvents.toSet().toList();
  technicalEvents = technicalEvents.toSet().toList();
  entrepreneurialEvents = entrepreneurialEvents.toSet().toList();
  speakers = speakers.toSet().toList();
  exhibitions = exhibitions.toSet().toList();
  informals = informals.toSet().toList();
}
