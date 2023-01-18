import 'dart:convert';
import 'package:http/http.dart' as http;

List<String> sponsorLinks = [];

void fetchSponsorLink(eventId) async {
  sponsorLinks = [];
  final response = await http.get(
    Uri.parse(
      'https://apiv.prometeo.in/api/EventSponsors/?event=$eventId',
    ),
  );

  if (response.statusCode == 200) {
    var list = json.decode(response.body) as List;
    for (var i = 0; i < list.length; i++) {
      String sponsorLink =
          'https://apiv.prometeo.in/' + list[i]['image'].substring(19);
      sponsorLinks.add(sponsorLink);
    }
  }
}
