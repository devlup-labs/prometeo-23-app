import 'package:flutter/material.dart';
import 'package:prometeo23/Background/bg.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircularParticleScreen(),
        Container(
          child: const Center(
            child: Text(
              'profile',
            ),
          ),
        ),
      ],
    );
  }
}
