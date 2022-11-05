import 'package:flutter/material.dart';
import 'package:prometeo23/pages/updates_page.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Icon(
              Icons.menu,
              color: Color(0xffccd6f6),
            ),
          ),
          GestureDetector(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdatesPage(),
                ),
              ),
            },
            child: Icon(
              Icons.notifications,
              color: Color(0xff64ffda),
            ),
          ),
        ],
      ),
    );
  }
}
