import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ThemeVideo extends StatefulWidget {
  const ThemeVideo({super.key});

  @override
  State<ThemeVideo> createState() => _ThemeVideoState();
}

class _ThemeVideoState extends State<ThemeVideo> {
  final videoUrl = 'https://youtu.be/YMx8Bbev6T4';
  late YoutubePlayerController _controller;

  @override
  void initState() {
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
