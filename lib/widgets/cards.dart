import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prometeo23/pages/event.dart';

class Cards extends StatefulWidget {
  String title;
  String date;
  String imageLink;

  Cards(
      {required this.imageLink,
      required this.date,
      required this.title,
      super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  bool like = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(
            context,
            rootNavigator: false,
          ).push(
            CupertinoPageRoute(
              builder: (context) => Event(
                eventName: widget.title,
                eventDate: widget.date,
                eventTime: "4pm - 12pm",
                eventDescription:
                    "Electronic music festival held in Belgium.\nTommorowland was first held in 2005 and has various different stages and themes.",
              ),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 400,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            // color: CupertinoColors.activeBlue
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(widget.imageLink),
            ),
          ),
          child: Stack(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 30, color: CupertinoColors.white),
                      ),
                    ),
                    FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          widget.date,
                          style: const TextStyle(
                            color: CupertinoColors.white,
                          ),
                        ))
                  ],
                ),
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: CupertinoColors.systemGrey,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: CupertinoButton(
                      onPressed: () {
                        setState(() {
                          like = !like;
                        });
                        print(like);
                      },
                      child: Icon(
                        CupertinoIcons.heart_fill,
                        color: like == true
                            ? CupertinoColors.systemPink
                            : CupertinoColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
