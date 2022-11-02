import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Color(0xff0a182e),  
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(CupertinoIcons.line_horizontal_3,
            color: Color(0xffccd6f6),),
            Icon(CupertinoIcons.bell_solid)
            ],
          ),

          // sized box
          const SizedBox(height: 25),
           
           // search bar
           Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xff8892b0),
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: const CupertinoSearchTextField(
              suffixIcon: Icon(
                CupertinoIcons.ellipsis_vertical,
                color: CupertinoColors.white
                ),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  CupertinoIcons.search,
                  color: CupertinoColors.white
                  ),
              ),
              )
            ),

            // sized box
            const SizedBox(height: 25),
            // Title of the slider
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const[
                Text(
                  'Flagship Events',
                  style: TextStyle(
                    color: CupertinoColors.white
                    )
                ),
                Icon(CupertinoIcons.ellipsis_circle)
                ]
              ),

            // sized box 

            const SizedBox(height: 20),
            // making the Tabs
            Container(  
              child: CupertinoSlidingSegmentedControl(
                backgroundColor: Color(0xff0a182e),
                thumbColor: Color(0xff0a182e),
                children: {
                  0: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xff64ffda)),
                      borderRadius: BorderRadius.all(Radius.circular(10))
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
            )

        ]
      )
    );
  }
}