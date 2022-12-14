import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prometeo23/models/Events.dart';


List TechnicalEventList = [];

void fetchEvent() async{
  final response = await http.get(Uri.parse('https://apiv.prometeo.in/api/events/'));
  
  if (response.statusCode == 200){
    var givenEvents = json.decode(response.body) as List;
    for(var event in givenEvents){
      var technicalevent = TechnicalEvent(event.name, event.image, event.description, event.prize);
      TechnicalEventList.add(technicalevent);
    }
  }

}