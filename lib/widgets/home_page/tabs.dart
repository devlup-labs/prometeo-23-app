import 'package:flutter/cupertino.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return  Container(  
              child: CupertinoSlidingSegmentedControl(
                backgroundColor: const Color(0xff0a182e),
                thumbColor: const Color(0xff0a182e),
                children: {
                  0: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: const Color(0xff64ffda)),
                      borderRadius: const BorderRadius.all(Radius.circular(10))
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Flagship Events',
                      style: TextStyle(color: Color(0xff64ffda),
                      fontSize: 12.0),
                      ),
                  ),
                  1: Container(
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      'Technical Events',
                      style: TextStyle(
                        color: Color(0xff8892b0),
                        fontSize: 12,
                      ),
                      ),
                  ),

                  2: Container(
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      'Entreprenurship Events',
                      style: TextStyle(color: Color(0xff8892b0),
                      fontSize: 12),
                      ),
                  ),
                }, 
                onValueChanged: (value){
                }),
            );
  } 
}