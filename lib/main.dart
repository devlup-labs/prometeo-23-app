import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prometeo23/pages/team.dart';
import 'package:prometeo23/widgets/splash_screen.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
