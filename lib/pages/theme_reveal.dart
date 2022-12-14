import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/widgets/app_bar.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';
import 'package:prometeo23/widgets/nav_drawer.dart';
import 'package:prometeo23/widgets/theme_video.dart';

class ThemeRevealPage extends StatefulWidget {
  const ThemeRevealPage({super.key});

  @override
  State<ThemeRevealPage> createState() => _ThemeRevealPageState();
}

class _ThemeRevealPageState extends State<ThemeRevealPage> {
  String themeDescription =
      "Technology has been the heart of the development of the human race from the very beginning and is speculated to be its heart till infinity. The theme of Prometeo 2023, “Origin to Infinity” is centered around the same thought where we explore what technology has been in the past, what it is now and what it can be in the future. This year we are going to explore the past and future of technological and entrepreneurial developments through a wide range of ideas developed and presented during the course of Prometeo'23. How did it all start? How did technology and economics reach where it is today? What will it look like in the future? Will we ever reach a saturation point? We, the team of Prometeo'23 invites you all to join us and participate in Prometeo'23 and explore the answers to all these questions through your participation, ideation and dedication.";
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: size.height * 0.03,
            top: size.height * 0.06,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomAppBar(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Prometeo'23 Theme",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ThemeVideo(),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Origin to Infinity",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                themeDescription,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: -1,
      ),
    );
  }
}
