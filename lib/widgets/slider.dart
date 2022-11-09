import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'cards.dart';

class CardSlider extends StatelessWidget {
  List<Widget> cards;
  double height;
  CardSlider({required this.cards, super.key, required this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  enlargeCenterPage: true,
                  height: height,
                ),
                items: cards,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
