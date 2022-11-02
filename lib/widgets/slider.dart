import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'cards.dart';

class CardSlider extends StatelessWidget {
  List <Widget>cards;
  CardSlider({required this.cards, super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                enlargeCenterPage: true,
                height: 350
              ),
              items: cards,
            ),

          ],
        ),
      ),
    );
  }
}
