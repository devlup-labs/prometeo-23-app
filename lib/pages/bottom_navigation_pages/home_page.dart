import 'dart:async';
import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:prometeo23/Background/bg.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/pages/umang.dart';
import 'package:prometeo23/widgets/app_bar.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';
import 'package:prometeo23/widgets/cards.dart';
import 'package:prometeo23/widgets/home_page/slider_headings.dart';
import 'package:prometeo23/widgets/home_page/tabs.dart';
import 'package:prometeo23/widgets/nav_drawer.dart';
import 'package:prometeo23/widgets/slider.dart';
import 'package:prometeo23/widgets/socials.dart';
import 'package:prometeo23/widgets/theme_video.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;

  List<Cards> TechnicalCards = [];

  List<Cards> EntrepreneurialCards = [];

  List SliderCards = [];

  bool isLoading = true;

  void fetchEvents() async {
    final response =
        await http.get(Uri.parse('https://apiv.prometeo.in/api/events/'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var list = json.decode(response.body) as List;

      //iterate over json and create a list of cards
      for (var i = 0; i < list.length; i++) {
        if (list[i]['type'] == 'technical') {
          String imageLink =
              "https://apiv.prometeo.in" + list[i]['image'].substring(19);

          TechnicalCards.add(
            Cards(
              eventId: list[i]['id'].toString(),
              title: list[i]['name'],
              prize: list[i]['prize'],
              imageLink: imageLink,
              description: list[i]['description'],
            ),
          );
        } else if (list[i]['type'] == 'entrepreneurial') {
          String imageLink =
              "https://apiv.prometeo.in" + list[i]['image'].substring(19);

          EntrepreneurialCards.add(
            Cards(
              eventId: list[i]['id'].toString(),
              title: list[i]['name'],
              prize: list[i]['prize'],
              imageLink: imageLink,
              description: list[i]['description'],
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

  int groupValue = 0;
  @override
  void initState() {
    super.initState();
    fetchEvents();
    SliderCards.add(TechnicalCards);
    SliderCards.add(EntrepreneurialCards);

    const fiveSec = const Duration(seconds: 5);
    new Timer.periodic(fiveSec, (Timer t) {
      fetchEvents();
    });
  }

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: bgColor,
      body: Container(
        padding: EdgeInsets.only(
          top: 40,
        ),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SlideInDown(
                  child: CustomAppBar(),
                ),
                // search bar
                // const SearchBar(),
                SlideInDown(
                  child: Container(
                    child: Image.asset(
                      // "https://apiv.prometeo.in/media/gallery/images/prometeo_logo_23-min.png",
                      "assets/prometeo_home_page.png",
                    ),
                  ),
                ),
                SlideInDown(child: LocationDate()),
                const SizedBox(
                  height: 30,
                ),
                // tabs
                SlideInDown(
                  child: Center(
                    child: isLoading
                        ? CircularProgressIndicator()
                        : Tabs(
                            SliderCards: SliderCards,
                          ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                SlideInLeft(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      "Theme Reveal",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                SlideInLeft(child: const ThemeVideo()),

                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Social Initiative: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "UMANG",
                      style: TextStyle(
                        color: Colors.amber[300],
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                UmangImage(size: size),

                const SizedBox(
                  height: 20,
                ),
                SlideInLeft(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      "Follow Us On",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                SlideInLeft(child: Socials()),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 0,
      ),
    );
  }
}

class UmangImage extends StatelessWidget {
  const UmangImage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Umang(),
          ),
        );
      },
      child: Container(
        height: size.height * 0.3,
        width: size.width,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 20,
        ),
        decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/umang.png",
            ),
          ),
        ),
      ),
    );
  }
}

class LocationDate extends StatelessWidget {
  const LocationDate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: const [
              Icon(
                Icons.location_pin,
                color: Colors.red,
                size: 24,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "IIT Jodhpur",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Row(
            children: const [
              Icon(
                Icons.edit_calendar,
                color: Colors.blue,
                size: 24,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "20th - 22nd Jan",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
