import 'dart:html';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class eventpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    "https://i.ytimg.com/vi/wBCwmRjh1uY/maxresdefault.jpg",
                    height: 200,
                    width: 500,
                    fit: BoxFit.fitWidth,
                  ),
                  const Positioned.fill(
                      child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Prometeo",
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                  ))
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "date:                                                                                time:",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: const ReadMoreText(
                      'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                      /*style: TextStyle(color: Colors.white, fontSize: 14),*/
                      trimLines: 2,
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          height: 50,
          width: 200,
          child: FloatingActionButton(
            backgroundColor: Colors.purple,
            child: Text("fee"), //child widget inside this button
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
            onPressed: () {
              print("Button is pressed.");
              //task to execute when this button is pressed
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
