import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ThemeVideo extends StatefulWidget {
  const ThemeVideo({super.key});

  @override
  State<ThemeVideo> createState() => _ThemeVideoState();
}

class _ThemeVideoState extends State<ThemeVideo> {
  late var videoUrl = 'https://youtu.be/8lOSuBvGfjo';

  bool isLoading = true;

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
        if (list[i]['name'] != "Prometeo-23-logo" &&
            list[i]['type'] == "video") {
          setState(() {
            videoUrl = videoLink;
          });
        }
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

    setState(() {
      isLoading = false;
    });
  }

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    fetchThemeVideo();
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: false,
      ),
    );
  }
}
