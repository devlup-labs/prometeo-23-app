import 'package:flutter/material.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/pages/bottom_navigation_pages/home_page.dart';
import 'package:prometeo23/pages/events_screen.dart';
import 'package:prometeo23/pages/preregistration.dart';
import 'package:prometeo23/pages/sponsors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

// ignore: must_be_immutable
class BottomNavigation extends StatefulWidget {
  int currentIndex;
  BottomNavigation({super.key, required this.currentIndex});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  // var widget.currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      color: bgColor,
      child: SalomonBottomBar(
        currentIndex: widget.currentIndex,
        onTap: (i) => setState(
          () {
            // widget.currentIndex = i;
            if (i != widget.currentIndex && i == 0) {
              widget.currentIndex = i;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            } else if (i != widget.currentIndex && i == 1) {
              widget.currentIndex = i;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EventsScreen(),
                ),
              );
            } else if (i != widget.currentIndex && i == 2) {
              widget.currentIndex = i;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Sponsors(),
                ),
              );
            } else if (i != widget.currentIndex && i == 3) {
              widget.currentIndex = i;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PreRegistration(),
                ),
              );
            }
          },
        ),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home, color: Colors.white),
            title: const Text("Home"),
            selectedColor: cyan,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.groups_rounded, color: Colors.white),
            title: const Text("Events"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.currency_rupee, color: Colors.white),
            title: const Text("Sponsors"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.app_registration_rounded, color: Colors.white),
            title: const Text("PreRegistration"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
