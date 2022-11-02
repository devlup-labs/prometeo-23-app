import 'package:flutter/cupertino.dart';
import 'package:prometeo23/pages/landing_page.dart';

void main() {
  runApp(const Prometeo());
}

class Prometeo extends StatelessWidget {
  const Prometeo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
