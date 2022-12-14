import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prometeo23/widgets/gallery_card.dart';

List<GalleryCard> SliderCards = [];

Future<void> fetchImages() async {
  final response =
      await http.get(Uri.parse('https://apiv.prometeo.in/api/gallery/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var list = json.decode(response.body) as List;

    //iterate over json and create a list of cards
    for (var i = 0; i < list.length; i++) {
      String imageLink =
          "https://apiv.prometeo.in" + list[i]['image'].substring(19);
      if (list[i]['name'] != "Prometeo-23-logo" && list[i]['type'] == "image") {
        SliderCards.add(
          GalleryCard(
            imageLink: imageLink,
          ),
        );
      }
    }
  }
}
