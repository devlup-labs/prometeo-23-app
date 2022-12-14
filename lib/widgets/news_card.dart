import 'package:flutter/material.dart';
import 'package:prometeo23/constants.dart';

class NewsCard extends StatefulWidget {
  String news;

  NewsCard({
    super.key,
    required this.news,
  });

  @override
  State<NewsCard> createState() => NewsCardState();
}

class NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: newsCardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Container(
          padding: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.newspaper,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: size.width * 0.6,
                child: Text(
                  widget.news,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
