import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/widgets/app_bar.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';
import 'package:prometeo23/widgets/gallery_card.dart';
import 'package:prometeo23/widgets/nav_drawer.dart';
import 'package:prometeo23/widgets/slider.dart';
import 'package:http/http.dart' as http;

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<GalleryCard> SliderCards = [];
  bool isLoading = true;

  Future<void> fetchImages() async {
    final response =
        await http.get(Uri.parse('https://apiv.prometeo.in/api/gallery/'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var list = json.decode(response.body) as List;

      //iterate over json and create a list of cards
      for (var i = 0; i < list.length; i++) {
        String imageLink =
            "https://apiv.prometeo.in" + list[i]['image'].substring(19);
        if (list[i]['name'] != "Prometeo-23-logo" &&
            list[i]['type'] == "image") {
          SliderCards.add(
            GalleryCard(
              imageLink: imageLink,
            ),
          );
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

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavDrawer(),
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.05,
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Prometeo\'22',
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Gallery ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              isLoading
                  ? CircularProgressIndicator()
                  : CardSlider(
                      cards: SliderCards,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "More Images",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              for (var i = 1; i < SliderCards.length; i++)
                isLoading
                    ? CircularProgressIndicator()
                    : Container(
                        margin: EdgeInsets.only(
                          bottom: 30,
                        ),
                        child: SliderCards[i],
                      ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(currentIndex: 1),
    );
  }
}
