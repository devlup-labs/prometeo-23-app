import 'package:flutter/material.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/widgets/app_bar.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';
import 'package:prometeo23/widgets/news_card.dart';
import 'package:prometeo23/widgets/news_day.dart';
import 'package:prometeo23/widgets/search_bar.dart';
import 'package:readmore/readmore.dart';

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
      backgroundColor: bgColor,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewsOfDayCard(),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Text(
                  "Latest updates",
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
              NewsCard(
                news:
                    "Your one stop destination to get all the latest updates about the fest.",
                date: "10/11/2022",
                imageLink:
                    "https://i.postimg.cc/sgBFfbkY/audience-on-music-notes-background-0610-min.jpg",
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(currentIndex: 3),
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
      children: [
        Text(
          "Discover",
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
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
