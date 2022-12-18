import 'package:flutter/material.dart';
import 'package:prometeo23/pages/login_signup.dart';
import 'package:prometeo23/widgets/custom_icon.dart';

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
            child: const CustomIcon(icon: Icons.menu)
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Image.asset(
                'assets/prometeo_home_page.png',
                fit: BoxFit.contain
              ),
            )
          ),
          GestureDetector(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginSignUp(),
                ),
              ),
            },
            child: const CustomIcon(icon: Icons.app_registration_rounded,)
          ),
        ],
      ),
    );
  }
}
