import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:prometeo23/widgets/cards.dart';
import 'package:prometeo23/widgets/home_page/cards_list.dart';
import 'package:prometeo23/widgets/home_page/slider_headings.dart';
import '../slider.dart';

class Tabs extends StatefulWidget {
  List SliderCards;

  Tabs({required this.SliderCards});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int activeIndex = 0;
  List headings = [
    'Registration Open',
    'Past Speakers',
    'Technical Events',
    'Entrepreneurship Events',
    'Exhibition',
    // 'Workshops',
    // 'Speakers'
  ];
  @override
  void initState() {
    super.initState();

    print(widget.SliderCards.length);
  }

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 12,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: headings.length,
              itemBuilder: ((context, index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: index == activeIndex
                            ? const Color(0xff64ffda)
                            : const Color(0x00000000),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                    child: Text(
                      headings[index],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 25),
          SliderHeading(heading: headings[activeIndex]),
          const SizedBox(height: 25),
          CardSlider(
            cards: widget.SliderCards[activeIndex],
            height: MediaQuery.of(context).size.height * 0.45,
          ),
        ],
      ),
    );
  }
}
