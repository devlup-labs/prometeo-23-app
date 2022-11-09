import 'package:flutter/material.dart';

class GalleryCard extends StatefulWidget {
  String imageLink;

  GalleryCard({required this.imageLink, super.key});

  @override
  State<GalleryCard> createState() => _GalleryCardState();
}

class _GalleryCardState extends State<GalleryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(
            widget.imageLink,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
