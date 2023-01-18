import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/widgets/app_bar.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';
import 'package:prometeo23/widgets/nav_drawer.dart';
import 'package:prometeo23/widgets/news_card.dart';

class UpdatesPage extends StatefulWidget {
  const UpdatesPage({super.key});

  @override
  State<UpdatesPage> createState() => _UpdatesPageState();
}

class _UpdatesPageState extends State<UpdatesPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: size.height * 0.05,
            left: size.width * 0.05,
            right: size.width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              const SizedBox(
                height: 20,
              ),
              const NewsOfDayWidget(),
              const SizedBox(
                height: 10,
              ),
              Text(
                "First Version of Prometeo'23 App released on Play Store",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Latest updates",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              NewsCard(
                news:
                    "Your one stop destination to get all the latest updates about the fest.",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(currentIndex: -1),
    );
  }
}

class NewsOfDayWidget extends StatelessWidget {
  const NewsOfDayWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: const  DecorationImage(
              image: AssetImage(
                "assets/updates-image.png",
              ),
              // fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: bgColor.withOpacity(0.5),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: const Alignment(-0.8, 0.8),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                color: bgColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "News of the Day",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DiscoverNews extends StatelessWidget {
  const DiscoverNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Discover",
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "News from Prometeo 23",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
