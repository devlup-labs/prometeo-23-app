import 'package:flutter/material.dart';
import 'package:prometeo23/widgets/speakers_cards.dart';


class SpeakersGrid extends StatelessWidget {
  const SpeakersGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(  
      itemCount: 10,
      
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        return const SpeakersCards();
      },
    );
  }
}