import 'package:http/http.dart' as http;
import 'dart:convert';

fetchEvents() async{
  final response = await http.get(Uri.parse('https://apiv.prometeo.in/api/events/'));

  if (response.statusCode == 200){
    var list = json.decode(response.body) as List;
    return list;
  }
}

