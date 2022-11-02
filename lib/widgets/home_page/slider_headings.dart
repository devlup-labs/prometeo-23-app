import 'package:flutter/cupertino.dart';

class SliderHeading extends StatelessWidget {
  String heading;
  SliderHeading({required this.heading, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        heading,
        style: const TextStyle(
          color: CupertinoColors.white,
          fontWeight: FontWeight.w800,
          fontSize: 24
        ),
      ),
      const Icon(CupertinoIcons.ellipsis_circle, color: Color(0xff64ffda))
    ]);
  }
}
