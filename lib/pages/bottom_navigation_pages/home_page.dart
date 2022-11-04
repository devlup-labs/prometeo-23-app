import 'package:flutter/cupertino.dart';
import 'package:prometeo23/Background/bg.dart';
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
    return Container(
      color: Color(0xff110F16),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Row(
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
                  ),
                  // search bar
                  // const SearchBar(),
                  Container(
                    child: Image.network(
                      "https://i.postimg.cc/xdmFVkjD/prometeo-logo-23.png",
                    ),
                  ),
                  LocationDate(),
                  // tabs
                  const Tabs(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LocationDate extends StatelessWidget {
  const LocationDate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Icon(
                CupertinoIcons.location_solid,
                color: Color(0xff64ffda),
                size: 24,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "IIT Jodhpur",
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                CupertinoIcons.calendar,
                color: Color(0xff64ffda),
                size: 24,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "23rd - 25th Jan",
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
