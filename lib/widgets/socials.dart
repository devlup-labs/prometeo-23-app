import 'package:flutter/material.dart';
import 'package:prometeo23/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Socials extends StatelessWidget {
  Socials({super.key});

  List socialMediaHandles = [
    {
      'imageLink': 'https://i.postimg.cc/MpFZ3T9k/instagram-1.png',
      'url': Uri.parse('https://www.instagram.com/prometeo.iitj/'),
    },
    {
      'imageLink': 'https://i.postimg.cc/3RpgJzkR/linkedin.png',
      'url': Uri.parse('https://www.linkedin.com/company/prometeo2022/'),
    },
    {
      'imageLink': 'https://i.postimg.cc/gJ9zd79N/twitter.png',
      'url': Uri.parse('https://twitter.com/IITJ_Prometeo'),
    },
    {
      'imageLink': 'https://i.imgur.com/8nWRpd5.png',
      'url': Uri.parse(
        'https://www.youtube.com/channel/UC-NOBZ0ioDzQ_IWRtdFfqhw',
      ),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: socialMediaHandles.map(
          (element) {
            return ElevatedButton(
              onPressed: () async {
                if (await canLaunchUrl(element['url']))
                  await launchUrl(
                    element['url'],
                    mode: LaunchMode.externalApplication,
                  );
                else
                  throw "Could not launch $element['url']";
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(bgColor),
              ),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(element['imageLink']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
