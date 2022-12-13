import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prometeo23/pages/team.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const Prometeo());
}

class Prometeo extends StatelessWidget {
  const Prometeo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children:  const [
                TeamScreen(position: 'Festival Chief',),
                TeamScreen(position: 'Marketing',),
                TeamScreen(position: 'PR'),
              ],
          
            ),
          ),

          Container(width: double.maxFinite, color: Color(0xff273a3e), height: 50, child: Center(child: SmoothPageIndicator(
            controller: pageController, 
            count: 3,
            effect: const ExpandingDotsEffect(
              activeDotColor: Colors.white,
              dotColor: Colors.blueGrey,
            ),
            )
           )
          )
        ],
      )
    );
  }
}
