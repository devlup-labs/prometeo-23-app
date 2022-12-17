import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  const CustomIcon({required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(  
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(  
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle
      ),
      child: Icon(
        icon,
        color: Colors.white
      ),
    );
  }
}