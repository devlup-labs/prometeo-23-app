import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prometeo23/pages/team.dart';
import 'package:prometeo23/widgets/splash_screen.dart';

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
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      home: PageView(
        children: const [
          TeamScreen(position: 'Festival Chief',),
          TeamScreen(position: 'Marketing',),
          TeamScreen(position: 'PR'),
        ],

      )
    );
  }
}
