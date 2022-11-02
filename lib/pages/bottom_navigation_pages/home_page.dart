import 'package:flutter/cupertino.dart';
import 'package:prometeo23/widgets/home_page/tabs.dart';
import 'package:prometeo23/widgets/slider.dart';

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
            Icon(
              CupertinoIcons.bell_solid,
              color: Color(0xff64ffda),)
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
      
            const SizedBox(height: 20),
      
            // tabs
            Tabs(),
      
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
                Icon(
                  CupertinoIcons.ellipsis_circle,
                  color: Color(0xff64ffda))
                ]
              ),

              // putting a sized box in between
              
              const SizedBox(height: 10),
              
              // introducing card slider
              const Expanded(
                child: CardSlider()
                )
      
        ]
      )
    );
  }
}