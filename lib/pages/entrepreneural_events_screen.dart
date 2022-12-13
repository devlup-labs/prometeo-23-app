import 'package:flutter/material.dart';

class EntrepreneuralEventsScreen extends StatelessWidget {
  const EntrepreneuralEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(  
      color: Colors.white,
      child: Column(  
        children: [
          Image.network('image.png'),
          Text('Entrereneural Events', style: TextStyle(color: Colors.blue[800]))
        ]
      )
    );
  }
}