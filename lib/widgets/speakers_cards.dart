import 'package:flutter/material.dart';
import 'package:prometeo23/pages/detials_page.dart';
import 'package:animations/animations.dart';


class SpeakersCards extends StatelessWidget {
  const SpeakersCards({super.key});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 1100),
      openBuilder: (context, _) => const DetailsPage(),
      closedBuilder: ((context, VoidCallback openContainer) => const Card()),
    );
  }
}

class Card extends StatefulWidget {
  const Card({super.key});

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(  
          borderRadius: BorderRadius.all(Radius.circular(70)),
          image: DecorationImage(
            image: NetworkImage('http://prometeo.rahulgopathi.tech/media/images/Inderpal_Bhandari_HD_1-compressed.jpg'),
            fit: BoxFit.cover)
        ),  
      ),
      Positioned(
        bottom: 0,
        height: 60,
        width: 170,
        child: Container(
          decoration: BoxDecoration( 
            color: Colors.white.withOpacity(0.4),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70),
            )
          ),
        ),
      ),
  
  
    ],);
  }
}