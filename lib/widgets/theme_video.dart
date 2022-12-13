import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:prometeo23/api/fetchThemeVideo.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ThemeVideo extends StatefulWidget {
  const ThemeVideo({super.key});

  @override
  State<ThemeVideo> createState() => _ThemeVideoState();
}

class _ThemeVideoState extends State<ThemeVideo> {
  late var videoUrl = 'https://youtu.be/GdNceDHonLU';

  bool isLoading = true;

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    fetchThemeVideo();
    setState(() {
      isLoading = false;
    });
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
