import 'package:flutter/material.dart';
import 'package:prometeo23/constants.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(  
        height: 400,
        decoration: const BoxDecoration(image: DecorationImage(image: NetworkImage('http://prometeo.rahulgopathi.tech/media/images/Inderpal_Bhandari_HD_1-compressed.jpg'),
        fit: BoxFit.cover),),

      ),
    );
  }
}