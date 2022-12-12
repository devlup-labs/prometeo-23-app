import 'package:flutter/material.dart';
import 'package:prometeo23/widgets/team_grid.dart';


class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

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
                children:const  [
                  Text('06',
                  style:TextStyle(
                    color: Colors.white
                  )),
                  Text('Festival Chief',
                  style: TextStyle(color: Colors.white)
                  ,)
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