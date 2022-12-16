import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prometeo23/api/fetchEvents.dart';
import 'package:prometeo23/api/fetchImages.dart';
import 'package:prometeo23/widgets/splash_screen.dart';

void main() {
  fetchEvents();
  fetchImages();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const Prometeo());
}

class Prometeo extends StatelessWidget {
  const Prometeo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, 
        home: SplashScreen()
      );
    }
}

