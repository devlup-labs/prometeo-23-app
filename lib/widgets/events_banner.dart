import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EventsBanner extends StatelessWidget {
  const EventsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(  
      height: 300, 
      child: Stack(   
        children: [ 
          Image.asset(  
            'assets\Rectangle 62.png', 
            width: double.maxFinite, 
            fit: BoxFit.cover,
          ), 

          Positioned(  
            bottom: 10, 
            child: Container(  
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
              child: const Text(
                'Events',
              )
            )
          )
        ],
      )
    );
  }
}