import 'package:flutter/material.dart';

class SpeakersCards extends StatelessWidget {
  const SpeakersCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
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


      ],)
      );
  }
}