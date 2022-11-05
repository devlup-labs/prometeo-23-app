import 'package:flutter/material.dart';
import 'package:prometeo23/Background/bg.dart';
import 'package:prometeo23/widgets/app_bar.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';
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
  int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: Color(0xff110F16),
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
                CustomAppBar(),
                // search bar
                // const SearchBar(),
                Container(
                  child: Image.network(
                    "https://i.postimg.cc/xdmFVkjD/prometeo-logo-23.png",
                  ),
                ),
                LocationDate(),
                const SizedBox(
                  height: 30,
                ),
                // tabs
                const Tabs(),

                const SizedBox(
                  height: 20,
                ),

                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Theme Reveal",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                ThemeVideo(),

                const SizedBox(
                  height: 20,
                ),

                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Follow Us On",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Socials(),
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
            children: [
              Icon(
                Icons.location_pin,
                color: Color(0xff64ffda),
                size: 24,
              ),
              const SizedBox(
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
            children: [
              Icon(
                Icons.edit_calendar,
                color: Color(0xff64ffda),
                size: 24,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "23rd - 25th Jan",
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
