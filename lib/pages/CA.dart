import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/pages/login_signup.dart';
import 'package:prometeo23/widgets/app_bar.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';
import 'package:prometeo23/widgets/nav_drawer.dart';

class CampusAmbassador extends StatefulWidget {
  const CampusAmbassador({super.key});

  @override
  State<CampusAmbassador> createState() => _CampusAmbassadorState();
}

class _CampusAmbassadorState extends State<CampusAmbassador> {
  String CampusAmbassadorDescription =
      "In the campus ambassador program, you will represent our fest, Prometeo, in your college community and encourage students to participate by highlighting the advantages of taking part in the fest. Campus Ambassador is a very reputed position as you will be representing your entire institute.";
  String OpportunityToGrow =
      "Your task as the campus ambassador is very flexible and easy to do, ranging from providing information about Prometeo '23 to asking students to register for the fest using your referral code. By becoming the campus ambassador you will serve as a link between the students of your college and Prometeo '23.\nIt will help to boost your confidence and leadership skills. Your communication skills will also bloom extravagantly. The campus ambassador program will become an asset if you are a student looking for great learning and networking opportunities.";
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
                "CampusAmbassador",
                style: GoogleFonts.poppins(
                  color: Colors.blue[800],
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
                    image: NetworkImage(
                      "https://prometeo.in/static/media/boat.01e920eb740d78292aff.png",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                CampusAmbassadorDescription,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "An Opportunity To Grow",
                style: GoogleFonts.poppins(
                  color: Colors.blue[800],
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                OpportunityToGrow,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Incentives",
                style: GoogleFonts.poppins(
                  color: Colors.blue[800],
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Silver Campus Ambassador",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "10+ Registrations (with accommodation)",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SilverCA(size: size),
              const SizedBox(
                height: 20,
              ),
              Text(
                "GOLD Campus Ambassador",
                style: GoogleFonts.poppins(
                  color: Colors.amberAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "20+ Registrations (with accommodation)",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GoldCA(size: size),
              const SizedBox(height: 30),
              Container(
                height: size.height * 0.07,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  // color: Color(0xff2087A8),
                  color: Colors.blue[800],
                  // color: Color(0xff003959),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginSignUp()),
                    );
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
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

class GoldCA extends StatelessWidget {
  const GoldCA({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://prometeo.in/static/media/concert.813780873847bca2c445.png",
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: size.width * 0.7,
              child: AutoSizeText(
                "Free Accommodation and Pronite Pass",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://prometeo.in/static/media/certificate.ad8ddd254a916a66448b.png",
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: size.width * 0.7,
              child: AutoSizeText(
                "Certificate",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://prometeo.in/static/media/souvenir.a6875ce9569ef0390cd3.png",
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: size.width * 0.7,
              child: AutoSizeText(
                "Goodies",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://prometeo.in/static/media/tickets.e9d6fb50c00e9b2a2ef0.png",
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: size.width * 0.7,
              child: AutoSizeText(
                "Free entry to 2 workshop",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SilverCA extends StatelessWidget {
  const SilverCA({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://prometeo.in/static/media/concert.813780873847bca2c445.png",
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: size.width * 0.7,
              child: AutoSizeText(
                "Free Accommodation and Pronite Pass",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://prometeo.in/static/media/certificate.ad8ddd254a916a66448b.png",
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: size.width * 0.7,
              child: AutoSizeText(
                "Certificate",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://prometeo.in/static/media/tickets.e9d6fb50c00e9b2a2ef0.png",
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: size.width * 0.7,
              child: AutoSizeText(
                "Free entry to 1 workshop",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
