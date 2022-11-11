import 'package:flutter/material.dart';
import 'package:prometeo23/widgets/speakers_cards.dart';


class SpeakersGrid extends StatelessWidget {
  SpeakersGrid({ super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(  
      itemCount: 18,
      
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        return SpeakersCards(speakerIndex: index,);
      },
    );
  }
}