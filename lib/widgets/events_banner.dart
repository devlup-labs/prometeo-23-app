import 'package:flutter/material.dart';

class EventBanner extends StatelessWidget {
  const EventBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(  
      children: [  
        Container(
          decoration: const BoxDecoration(  
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45), bottomRight: Radius.circular(45))
          ),
          child: Image.asset(  
            'assets/Rectangle 62.png',
            width: double.maxFinite,
            height: double.maxFinite, 
            fit: BoxFit.cover
          ),
        ),
      ]
    );
  }
}