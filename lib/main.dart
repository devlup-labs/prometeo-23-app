import 'package:flutter/cupertino.dart';
import 'package:prometeo23/widgets/cards.dart';
import 'package:prometeo23/widgets/slider.dart';
import 'widgets/cards.dart';
import 'widgets/slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: CardSlider(),
      ),
    );
  }
}
