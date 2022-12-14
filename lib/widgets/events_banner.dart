import 'package:flutter/material.dart';

class EventBanner extends StatelessWidget {
  const EventBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(  
      children: [  
        Image.asset(  
          'assets/Rectangle 62.png',
          width: double.maxFinite,
          height: double.maxFinite, 
          fit: BoxFit.cover
        ),

        Positioned( 
          bottom: 20, 
          left: 20,  
          child: Container( 
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: -10,
                  offset: Offset(-5, -5),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: -10,
                  offset: Offset(7, 7),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(  
              'Technical Events',
              style: TextStyle(  
                fontSize: 20,
                color: Colors.white
              )
            )
          )
        )
      ]
    );
  }
}