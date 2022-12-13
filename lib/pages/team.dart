import 'package:flutter/material.dart';
import 'package:prometeo23/widgets/team_grid.dart';


class TeamScreen extends StatelessWidget {
  final String position;
  const TeamScreen({required this.position, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff273a3e),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  const Text(
                    'Our Team', 
                    style: TextStyle(  
                      color: Colors.white,
                      fontSize: 36,
                    )
                  ),

                  Text(
                    position,
                    style: const TextStyle(  
                      color: Colors.grey,
                      fontSize: 16
                    )
                  )
                ],
              ),
              
              const SizedBox(height: 20),
              
              Expanded(
                child: PageView(
                  children: const [
                    TeamGrid(),
                  ],
                )
              )
            ],
          ),
        ),
      )
    );
  }
}