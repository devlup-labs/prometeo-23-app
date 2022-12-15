import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TechnicalEventsScreen extends StatelessWidget {
  const TechnicalEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(  
      color: Color(0xff1d1261),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(  
            'https://o.remove.bg/downloads/41440745-efec-4b85-85c1-5fbbb008a040/artificial-intelligence-ai-robot-server-room-digital-technology-banner-computer-equipment_39422-768-removebg-preview.png'
          ),

          const Text(
            'Technical Events',
            style: TextStyle(  
              color: Colors.white,
              fontSize: 24 
            )
          ),

          const SizedBox(height: 20),
          TextButton(  
            child: Text('Scroll Down', style: TextStyle(fontSize: 20, color: Colors.white)),
            onPressed: () => {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.blueGrey
            ),
          )
          
        ],
      )
    );
  }
}