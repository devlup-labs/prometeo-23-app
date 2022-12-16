import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prometeo23/models/event.dart';

List <EventDetail> eventList = [];
List <EventDetail> technicalEvents = [];
List <EventDetail> enterperneuralEvents = [];
List <EventDetail> speakers = [];
List <EventDetail> exhibitions = [];
List <EventDetail> informals = [];

Future fetchData() async{
  // fetching data 
  final response = await http.get(Uri.https('apiv.prometeo.in','/api/events/'));
  final jsonResponse = jsonDecode(response.body) as List;

  for(var event in jsonResponse){
      eventList.add(EventDetail(
        name: event['name'] ?? '',
        date: event['date'] ?? '12th may',
        image: "https://apiv.prometeo.in/${event['image'].substring(19)}"  ,
        description: event['description'] ?? '', 
        prizeMoney: event['prizeMoney'] ?? 'NA',
        eventLocation: event['venue'] ?? 'None',
        eventType: event['type'] ?? ' ',
        unstopLink: event['external_link'] ?? '',
        rulebookLink: event['rulebook_link'] ?? '',
        isSpeaker: event['isSpeaker'] ?? false

        ));
  }

  for(var event in eventList){
    if(event.eventType == 'technical'){
      technicalEvents.add(event);
    }
    else if(event.eventType == 'entrepreneural'){
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