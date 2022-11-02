import 'package:flutter/cupertino.dart';
import 'package:prometeo23/widgets/home_page/tabs.dart';
import 'package:prometeo23/widgets/search_bar.dart';
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
    return SingleChildScrollView(
      child: Container(
        color: Color(0xff0a182e),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  CupertinoIcons.line_horizontal_3,
                  color: Color(0xffccd6f6),
                ),
                Icon(
                  CupertinoIcons.bell_solid,
                  color: Color(0xff64ffda),
                )
              ],
            ),
            // search bar
            SearchBar(),
    
            // tabs
            Tabs(),

          ],
        ),
      ),
    );
  }
}