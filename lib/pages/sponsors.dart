import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/widgets/app_bar.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';
import 'package:prometeo23/widgets/nav_drawer.dart';
import 'package:http/http.dart' as http;

class Sponsors extends StatefulWidget {
  const Sponsors({super.key});

  @override
  State<Sponsors> createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {
  bool isLoading = true;

  List TitleSponsors = [];

  List AssociateSponsors = [];

  List OnlineMediaSponsors = [];

  List ConsultancyPartner = [];

  List TechnicalEventsPartner = [];

  List VCPartner = [];

  List WorkshopPartner = [];

  List ServicesPartner = [];

  List EntertainmentPartner = [];

  List GiftingsPartner = [];

  List DigitalMediaPartner = [];

  List PrintingPartner = [];

  List MediaPartner = [];

  List MerchandisePartner = [];

  Future<void> fetchSponsors() async {
    final response =
        await http.get(Uri.parse('https://apiv.prometeo.in/api/sponsors/'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var list = json.decode(response.body) as List;

      //iterate over json and create a list of cards
      for (var i = 0; i < list.length; i++) {
        String imageLink =
            "https://apiv.prometeo.in" + list[i]['image'].substring(19);
        if (list[i]['designation'] == 1) {
          TitleSponsors.add(
            imageLink,
          );
        } else if (list[i]['designation'] == 2) {
          AssociateSponsors.add(
            imageLink,
          );
        } else if (list[i]['designation'] == 3) {
          OnlineMediaSponsors.add(
            imageLink,
          );
        } else if (list[i]['designation'] == 4) {
          ConsultancyPartner.add(
            imageLink,
          );
        } else if (list[i]['designation'] == 5) {
          TechnicalEventsPartner.add(
            imageLink,
          );
        } else if (list[i]['designation'] == 6) {
          VCPartner.add(
            imageLink,
          );
        } else if (list[i]['designation'] == 7) {
          WorkshopPartner.add(
            imageLink,
          );
        } else if (list[i]['designation'] == 8) {
          ServicesPartner.add(
            imageLink,
          );
        } else if (list[i]['designation'] == 9) {
          EntertainmentPartner.add(
            imageLink,
          );
        } else if (list[i]['designation'] == 10) {
          GiftingsPartner.add(
            imageLink,
          );
        } else if (list[i]['designation'] == 11) {
          DigitalMediaPartner.add(
            imageLink,
          );
        } else if (list[i]['designation'] == 12) {
          PrintingPartner.add(
            imageLink,
          );
        } else if (list[i]['designation'] == 13) {
          MediaPartner.add(
            imageLink,
          );
        } else if (list[i]['designation'] == 14) {
          MerchandisePartner.add(
            imageLink,
          );
        }
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchSponsors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: bgColor,
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.05,
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Past Sponsors",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SponsorTag(
                sponsorName: "Title Sponsor",
              ),
              const SizedBox(
                height: 30,
              ),
              SponsorBuilder(SponsorsList: TitleSponsors),
              const SizedBox(
                height: 30,
              ),
              SponsorTag(
                sponsorName: "Associate Sponsor",
              ),
              const SizedBox(
                height: 30,
              ),
              SponsorBuilder(SponsorsList: AssociateSponsors),
              const SizedBox(
                height: 30,
              ),
              SponsorTag(
                sponsorName: "Online Media Sponsor",
              ),
              const SizedBox(
                height: 30,
              ),
              SponsorBuilder(SponsorsList: OnlineMediaSponsors),
              const SizedBox(
                height: 30,
              ),
              SponsorTag(
                sponsorName: "Consultancy Partner",
              ),
              const SizedBox(
                height: 30,
              ),
              SponsorBuilder(SponsorsList: ConsultancyPartner),
              const SizedBox(
                height: 30,
              ),
              SponsorTag(
                sponsorName: "Technical Events Partner",
              ),
              const SizedBox(
                height: 30,
              ),
              SponsorBuilder(SponsorsList: TechnicalEventsPartner),
              const SizedBox(
                height: 30,
              ),
              SponsorTag(
                sponsorName: "VC Partner",
              ),
              const SizedBox(
                height: 30,
              ),
              SponsorBuilder(SponsorsList: VCPartner),
              const SizedBox(
                height: 30,
              ),
              SponsorTag(
                sponsorName: "Workshop Partner",
              ),
              const SizedBox(
                height: 30,
              ),
              SponsorBuilder(SponsorsList: WorkshopPartner),
              const SizedBox(
                height: 30,
              ),
              SponsorTag(
                sponsorName: "Services Partner",
              ),
              const SizedBox(
                height: 30,
              ),
              SponsorBuilder(SponsorsList: ServicesPartner),
              const SizedBox(
                height: 30,
              ),
              SponsorTag(
                sponsorName: "Entertainment Partner",
              ),
              const SizedBox(
                height: 30,
              ),
              SponsorBuilder(SponsorsList: EntertainmentPartner),
              const SizedBox(
                height: 30,
              ),
              SponsorTag(
                sponsorName: "Giftings Partner",
              ),
              const SizedBox(
                height: 30,
              ),
              SponsorBuilder(SponsorsList: GiftingsPartner),
              const SizedBox(
                height: 30,
              ),
              SponsorTag(
                sponsorName: "Digital Media Partner",
              ),
              const SizedBox(
                height: 30,
              ),
              SponsorBuilder(SponsorsList: DigitalMediaPartner),
              const SizedBox(
                height: 30,
              ),
              SponsorTag(
                sponsorName: "Printing Partner",
              ),
              const SizedBox(
                height: 30,
              ),
              SponsorBuilder(SponsorsList: PrintingPartner),
              const SizedBox(
                height: 30,
              ),
              SponsorTag(
                sponsorName: "Media Partner",
              ),
              const SizedBox(
                height: 30,
              ),
              SponsorBuilder(SponsorsList: MediaPartner),
              const SizedBox(
                height: 30,
              ),
              SponsorTag(
                sponsorName: "Merchandise Partner",
              ),
              const SizedBox(
                height: 30,
              ),
              SponsorBuilder(SponsorsList: MerchandisePartner),
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

class SponsorBuilder extends StatelessWidget {
  const SponsorBuilder({
    Key? key,
    required this.SponsorsList,
  }) : super(key: key);

  final List SponsorsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var i = 0; i < SponsorsList.length; i++)
          Column(
            children: [
              Image.network(
                SponsorsList[i],
                height: MediaQuery.of(context).size.height / 8,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
      ],
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
            style: const TextStyle(
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
