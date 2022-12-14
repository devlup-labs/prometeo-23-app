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
        //glassmorphism
        color: Colors.white.withOpacity(0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: -10,
            offset: Offset(-5, -5),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: -10,
            offset: Offset(7, 7),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              widget.imageLink,
            ),
            // fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
