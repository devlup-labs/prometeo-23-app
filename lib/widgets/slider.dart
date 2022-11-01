// import '.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'cards.dart';

final List<Widget> imageSliders = [
  Cards(
    title: "gjh",
    date: "222",
    imageLink:
        "https://hullabaloo.co.uk/wp-content/uploads/2016/03/Hullabaloo-Loughborough-Graphics-Design-Blog-Images-0042..jpg",
  ),
  Cards(
    title: "gjh",
    date: "222",
    imageLink:
        "https://hullabaloo.co.uk/wp-content/uploads/2016/03/Hullabaloo-Loughborough-Graphics-Design-Blog-Images-0042..jpg",
  ),
  Cards(
    title: "gjh",
    date: "222",
    imageLink:
        "https://hullabaloo.co.uk/wp-content/uploads/2016/03/Hullabaloo-Loughborough-Graphics-Design-Blog-Images-0042..jpg",
  ),
  Cards(
    title: "gjh",
    date: "222",
    imageLink:
        "https://hullabaloo.co.uk/wp-content/uploads/2016/03/Hullabaloo-Loughborough-Graphics-Design-Blog-Images-0042..jpg",
  ),
];

class CardSlider extends StatelessWidget {
  const CardSlider({super.key});
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
                // aspectRatio: 2.0,
                // enlargeCenterPage: true,
              ),
              items: imageSliders,
            ),
          ],
        ),
      ),
    );
  }
}
