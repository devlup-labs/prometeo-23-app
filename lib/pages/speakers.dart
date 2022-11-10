import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/widgets/app_bar.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';
import 'package:prometeo23/widgets/speakers_grid.dart';

class SpeakersPage extends StatelessWidget {
  const SpeakersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: bgColor, 
      bottomNavigationBar: BottomNavigation(currentIndex: 0),
      body: SafeArea(
        child: Container( 
          padding: const EdgeInsets.symmetric(horizontal: 20.0), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [  
              const CustomAppBar(),
              const SizedBox(height: 20.0),
              FadeInLeft(
                duration: const Duration(milliseconds: 1500),
                child: const Text(
                  'Past Speakers',
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),

              FadeInLeft(
                duration: const Duration(milliseconds: 1500),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: const Text(
                    'We have had the pleasure of hosting some amazing speakers from all over the world at Prometeo 23.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor
                    )
                  ),
                ),
              ),

              const SizedBox(height: 20.0),

              // making the speakers grid
              Expanded(
                child: FadeInUp(
                  delay: const Duration(milliseconds: 1500),
                  child: SpeakersGrid(),
                  )
                ),
            ],
          )
        ),
      )
    );
  }
}