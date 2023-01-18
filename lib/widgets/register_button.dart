import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  Function onPressed;
  String text;
  RegisterButton({
    Key? key,
    required this.size,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.07,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        // color: Color(0xff096B65),
        color: const Color(0xff003959),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: onPressed as Future<dynamic> Function()?,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
