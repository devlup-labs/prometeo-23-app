import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List headings = [
    'Flagship Events',
    'Entreprenurship Events',
    'Technical Events',
    'Workshops',
    'Speakers'
    ];
  @override
  Widget build(BuildContext context) {
    return  Container( 
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: headings.length, 
        itemBuilder: ((context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: const Color(0xff64ffda)),
              borderRadius: const BorderRadius.all(Radius.circular(20))
            ),
            child: CupertinoButton(
              onPressed: () {},
              child: Text(headings[index],
              style: const TextStyle(
                color: CupertinoColors.white
              ),),),
          );
        })
        )
    );
  } 
}