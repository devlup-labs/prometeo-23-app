import 'package:flutter/material.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';

class Sponsors extends StatefulWidget {
  const Sponsors({super.key});

  @override
  State<Sponsors> createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.08,
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SponsorTag(
                sponsorName: "Title Sponsor",
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 10,
                    child: Image.network(
                      "https://i.postimg.cc/GmtKPLgy/nvidia.png",
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 12,
                    child: Image.network(
                      "https://i.postimg.cc/Zqc6XXQS/ccs.png",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SponsorTag(
                sponsorName: "Associate Sponsor",
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 2,
      ),
    );
  }
}

class SponsorTag extends StatelessWidget {
  String sponsorName;
  SponsorTag({required this.sponsorName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            sponsorName,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 5,
            width: MediaQuery.of(context).size.width * 0.2,
            color: Colors.orange,
          )
        ],
      ),
    );
  }
}
