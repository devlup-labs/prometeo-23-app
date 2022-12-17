import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(  
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(  
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle
      ),
      child: const Icon(
        Icons.app_registration_rounded,
        color: Colors.white
      ),
    );
  }
}