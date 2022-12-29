import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PrometeoDates extends StatelessWidget {
  const PrometeoDates({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        width: double.maxFinite,
        child: Row(children: [
          Flexible(
            child: Container(
                height: 66,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color(0xff179F97).withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Colors.white),
                    SizedBox(width: 5),
                    SizedBox(
                      width: size.width * 0.28,
                      child: AutoSizeText(
                        'IIT Jodhpur',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ))),
          ),
          Flexible(
            child: Container(
                height: 66,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color(0xff96FFDF).withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.calendar_month, color: Colors.white),
                  SizedBox(width: 5),
                  SizedBox(
                    width: size.width * 0.28,
                    child: AutoSizeText(
                      '20th - 22nd Jan',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      maxLines: 1,
                    ),
                  ),
                ])),
          )
        ]));
  }
}
