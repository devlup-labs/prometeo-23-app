import 'package:flutter/material.dart';
import 'package:prometeo23/pages/bottom_navigation_pages/home_page.dart';
import 'package:prometeo23/pages/landing_page.dart';

void main() {
  runApp(const Prometeo());
}

class Prometeo extends StatelessWidget {
  const Prometeo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
