import 'package:flutter/material.dart';

class SpeakersCards extends StatelessWidget {
  const SpeakersCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration( 
        border: Border.all(color: Colors.white, width: 1), 
        borderRadius: const BorderRadius.all(Radius.circular(60),
        )
      ),
    );
  }
}