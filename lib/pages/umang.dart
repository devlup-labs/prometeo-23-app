import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/widgets/app_bar.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';
import 'package:prometeo23/widgets/nav_drawer.dart';

class Umang extends StatefulWidget {
  const Umang({super.key});

  @override
  State<Umang> createState() => _UmangState();
}

class _UmangState extends State<Umang> {
  String umangDescription =
      "Prometeo's vision is to raise awareness in society through social upliftment activities. We believe that it is the societal responsibility of the forefront of the nation to balance and empower those who are less fortunate. In post, we organized blood donation drives and year-long problem statements related to sustainability with big prize money, Continuing this legacy, In this edition of Prometeo, we aim to acquaint underprivileged women to new technologies and raise awareness about the heights they can achieve with the help of it. We plan to collaborate with several NGOs ond hold workshops for indigent children which will instigate their interest towards several domains of technology and inspire to pursue them.";
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
                "Umang",
                style: GoogleFonts.poppins(
                  color: Colors.amber[300],
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: size.height * 0.3,
                width: size.width,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/umang.png",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                umangDescription,
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
