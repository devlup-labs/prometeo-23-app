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



      Cards eventCard = Cards(
            eventId:event['id'].toString(),
            title: event['name'],
            prize: event['prize'] ?? ' ',
            imageLink: imageLink,
            description: event['description'] ?? ' ',
            isSpeaker: (event['type'] == 'talk'),
            eventType: event['type'],
            ruleBookLink: event['rulebook_link'] ?? '',
            unstopLink: event["external_link"]?? ' ' ,
            eventLocation: event["venue"] ?? '',
            eventDate: event["date"] ?? '',
          );

      if (event['registration_open'] == true) {
        LiveEvents.add(eventCard);
      }

      if (event['type'] == 'technical') {
        TechnicalCards.add(
  eventCard
        );
      }
      if (event['type'] == 'entrepreneurial') {
        EntrepreneurialCards.add(
eventCard
        );
      }

      if (event['type'] == 'exhibition') {
        Exhibition.add(eventCard
        );

      if (event['type'] == 'talk') {
        Speakers.add(eventCard);
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
  print('checking for the length');
  print(LiveEvents.length);

}


