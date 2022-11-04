import 'package:flutter/material.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/pages/bottom_navigation_pages/home_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff110F16),
      child: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(
          () {
            _currentIndex = i;
            if (_currentIndex == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            } else {}
          },
        ),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            title: Text("Home"),
            selectedColor: backgroudColor,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border, color: Colors.white),
            title: Text("Gallery"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.currency_rupee, color: Colors.white),
            title: Text("Sponsors"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.newspaper, color: Colors.white),
            title: Text("Updates"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
