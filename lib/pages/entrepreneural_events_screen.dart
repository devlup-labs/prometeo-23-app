import 'package:flutter/material.dart';

class EntrepreneuralEventsScreen extends StatelessWidget {
  const EntrepreneuralEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(  
      color: Colors.white,
      child: Column(  
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network('https://o.remove.bg/downloads/75c5439a-caf7-4f2e-a281-b3834053be02/two-business-partners-handshaking_74855-6685-removebg-preview.png'),
          Text('Entrereneural Events', style: TextStyle(color: Colors.blue[800]))
        ]
      )
    );
  }
}