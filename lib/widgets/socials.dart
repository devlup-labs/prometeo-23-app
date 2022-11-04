import 'package:flutter/material.dart';
import 'package:prometeo23/constants.dart';

class Socials extends StatelessWidget {
  Socials({super.key});

  List socialMediaHandles = [
    {
      'imageLink': 'https://i.postimg.cc/gJ9zd79N/twitter.png',
      'url': '',
    },
    {
      'imageLink': 'https://i.postimg.cc/MpFZ3T9k/instagram-1.png',
      'url': '',
    },
    {
      'imageLink': 'https://i.postimg.cc/3RpgJzkR/linkedin.png',
      'url': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: socialMediaHandles.map(
          (element) {
            return ElevatedButton(
              onPressed: () {
                print('Hello');
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
