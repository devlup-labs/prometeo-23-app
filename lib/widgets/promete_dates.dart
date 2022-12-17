import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PrometeoDates extends StatelessWidget {
  const PrometeoDates({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(  
      width: double.maxFinite,
      child: Row(  
        children: [
          Container(   
            color: const Color(0xff96FFDF),
            child: Center(  
              child: Row(
                children: const [
                  Icon(Icons.location_on),
                  Text('IIT Jodhpur'),
                ],
              )
            )
          ),
          Container(  
            color: Colors.blueGrey,
            child: Row(  
              children: const [  
                Icon(Icons.calendar_month),
                Text('20th - 22nd Jan')
              ]
            )
          )
        ]
      )
    );
  }
}