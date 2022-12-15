import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prometeo23/models/Events.dart';

List<TechnicalEvent> technicalEventList = [];
List entrepreneuralEventsList = [];
List speakersList = [];


void fetchData() async {
  var response =
      await http.get(Uri.parse('http://apiv.prometeo.in/api/events'));
  var jsonResponse = await jsonDecode(response.body) as List;

  if (response.statusCode == 200) {
    for (var event in jsonResponse) {
      if(event['type'] == 'technical'){
      var technicalEvent = TechnicalEvent(
          name: event['name'],
          image: event['image'],
          description: event['description'],
          prizeMoney: event['prizeMoney'],
          date: event['date']);
      technicalEventList.add(technicalEvent);
      }
    }
  }
}
