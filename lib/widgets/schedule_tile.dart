import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class ScheduleTile extends StatelessWidget {
  const ScheduleTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(  
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      blur: 10,
      border: 0,
      borderRadius: 20,
      linearGradient: LinearGradient(  
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.1),
          const Color(0xFFFFFFFF).withOpacity(0.05),
        ],
        stops: const [0.1, 1],
      ),
      borderGradient: LinearGradient(  
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.5),
          const Color(0xFFFFFFFF).withOpacity(0.5),
        ],
      ),

      child: Column(   
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'Kaggle Knight',
                style: TextStyle(  
                  color: Colors.white,
                  fontSize: 20,
                )
              ),
              Text(  
                '10:00', 
                style: TextStyle(   
                  color: Colors.white
                )
              )
            ]
          )
        ]
      )


    );
  }
}