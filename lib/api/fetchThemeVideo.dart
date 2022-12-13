import 'dart:convert';
import 'package:http/http.dart' as http;

late var videoUrl = 'https://youtu.be/GdNceDHonLU';

Future<void> fetchThemeVideo() async {
  final response =
      await http.get(Uri.parse('https://apiv.prometeo.in/api/gallery/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var list = json.decode(response.body) as List;

    //iterate over json and create a list of cards
    for (var i = 0; i < list.length; i++) {
      String videoLink = list[i]['video'];
      if (list[i]['name'] != "Theme Reveal" && list[i]['type'] == "video") {
        videoUrl = videoLink;
      }
    }
  }
}
