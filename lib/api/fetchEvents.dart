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

List <EventDetail> eventList = [];
List <EventDetail> technicalEvents = [];
List <EventDetail> enterperneuralEvents = [];
List <EventDetail> speakers = [];
List <EventDetail> exhibitions = [];
List <EventDetail> informals = [];


void fetchEvents() async {
  final response = await http.get(Uri.parse('https://apiv.prometeo.in/api/events/'));

  if (response.statusCode == 200) {
    var list = json.decode(response.body) as List;
    
    
    for (var event in list) {
      String imageLink = "https://apiv.prometeo.in/${event['image'].substring(19)}" ;

      eventList.add(EventDetail(
        name: event['name'],
        date: event['date'] ?? '12th may',
        image: event['image'],
        description: event['description'] ?? '', 
        prizeMoney: event['prizeMoney'] ?? 'NA',
        eventLocation: event['venue'] ?? 'None',
        eventType: event['type'],
        unstopLink: event['external_link'] ?? '',
        rulebookLink: event['rulebook_link'] ?? '',
        isSpeaker: event['isSpeaker'] ?? false

        ));
  

      if (event['registration_open'] == true) {
        LiveEvents.add(
          Cards(
            eventId:event['id'].toString(),
            title: event['name'],
            prize: event['prize'],
            imageLink: imageLink,
            description: event['description'],
            isSpeaker: (event['type'] == 'talk'),
            eventType: event['type'],
            ruleBookLink: event['rulebook_link'],
            unstopLink: event["external_link"],
            eventLocation: event["venue"],
            eventDate: event["date"],
          ),
        );
      }

      if (event['type'] == 'technical') {
        TechnicalCards.add(
          Cards(
            eventId: event['id'].toString(),
            title: event['name'],
            prize: event['prize'],
            imageLink: imageLink,
            description: event['description'],
            isSpeaker: false,
            eventType: "Technical EventDetail",
            ruleBookLink: event['rulebook_link'],
            unstopLink: event["external_link"],
            eventLocation: event["venue"],
            eventDate: event["date"],
          ),
        );

      if (event['type'] == 'entrepreneurial') {
        EntrepreneurialCards.add(
          Cards(
            eventId: event['id'].toString(),
            title: event['name'],
            prize: event['prize'],
            imageLink: imageLink,
            description: event['description'],
            isSpeaker: false,
            eventType: "Entrepreneurial EventDetail",
            ruleBookLink: event['rulebook_link'],
            unstopLink: event["external_link"],
            eventLocation: event["venue"],
            eventDate: event["date"],
          ),
        );
      }
      if (event['type'] == 'exhibition') {
        Exhibition.add(
          Cards(
            eventId: event['id'].toString(),
            title: event['name'],
            prize: event['prize'],
            imageLink: imageLink,
            description: event['description'],
            isSpeaker: false,
            eventType: "Exhibition",
            ruleBookLink: event['rulebook_link'],
            unstopLink: event["external_link"],
            eventLocation: event["venue"],
            eventDate: event["date"],
          ),
        );

      if (event['type'] == 'talk') {
        Speakers.add(
          Cards(
            eventId: event['id'].toString(),
            title: event['name'],
            prize: event['prize'],
            imageLink: imageLink,
            description: event['description'],
            isSpeaker: true,
            eventType: "Talk Session",
            ruleBookLink: event['rulebook_link'],
            unstopLink: event["external_link"],
            eventLocation: event["venue"],
            eventDate: event["date"],
          ),
        );
      }
    }
  }

  }
}

  for(var event in eventList){
    if(event.eventType == 'technical'){
      technicalEvents.add(event);
    }
    else if(event.eventType == ''){
      enterperneuralEvents.add(event);
    }
    else if(event.eventType == 'talk'){
      speakers.add(event);
    }
    else if(event.eventType == 'exhibition'){
      exhibitions.add(event);
    }
    else if(event.eventType == 'informals'){
      informals.add(event);
    }

  }
}
