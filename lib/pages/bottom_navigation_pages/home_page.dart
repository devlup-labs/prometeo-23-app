import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:prometeo23/api/fetchEvents.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/pages/CA.dart';
import 'package:prometeo23/pages/umang.dart';
import 'package:prometeo23/widgets/app_bar.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';
import 'package:prometeo23/widgets/home_page/tabs.dart';
import 'package:prometeo23/widgets/nav_drawer.dart';
import 'package:prometeo23/widgets/promete_dates.dart';
import 'package:prometeo23/widgets/socials.dart';
import 'package:prometeo23/widgets/theme_video.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  bool isLoading = true;
  int groupValue = 0;
  @override
  void initState() {
    super.initState();

    SliderCards.add(LiveEvents);
    SliderCards.add(Speakers);
    SliderCards.add(TechnicalCards);
    SliderCards.add(EntrepreneurialCards);
    SliderCards.add(Exhibition);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: universalPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SlideInDown(
                child: CustomAppBar(
                  isHomePage: true,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.0375),
              SlideInDown(child: const PrometeoDates()),
              SizedBox(height: MediaQuery.of(context).size.height * 0.0375),
              // tabs
              SlideInDown(
                child: Center(
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : Tabs(
                          SliderCards: SliderCards,
                        ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.0375),

              SlideInLeft(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Theme Reveal",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.025),

              SlideInLeft(child: const ThemeVideo()),

              SizedBox(height: MediaQuery.of(context).size.height * 0.025),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Social Initiative: ",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "UMANG",
                    style: GoogleFonts.poppins(
                      color: Colors.amber[300],
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.025),

              UmangImage(size: size),

              SizedBox(height: MediaQuery.of(context).size.height * 0.025),

              SlideInLeft(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Campus Ambassador Program",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.025),

              CAImage(size: size),

              SizedBox(height: MediaQuery.of(context).size.height * 0.025),

              SlideInLeft(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Follow Us On",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.025),

              SlideInLeft(child: Socials()),

              SizedBox(height: MediaQuery.of(context).size.height * 0.025)
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 0,
      ),
    );
  }
}

class CAImage extends StatelessWidget {
  const CAImage({
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
            builder: (context) => const CampusAmbassador(),
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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://prometeo.in/static/media/social_media.e44ee7339ec3772a2bda.png",
            ),
          ),
        ),
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
            builder: (context) => const Umang(),
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
        decoration: const BoxDecoration(
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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_pin,
                color: Colors.red,
                size: 24,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "IIT Jodhpur",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.edit_calendar,
                color: Colors.blue,
                size: 24,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "20th - 22nd Jan",
                style: GoogleFonts.poppins(
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
