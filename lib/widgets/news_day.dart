import 'package:flutter/material.dart';
import 'package:prometeo23/constants.dart';

class NewsOfDayCard extends StatefulWidget {
  @override
  State<NewsOfDayCard> createState() => _NewsOfDayCardState();
}

class _NewsOfDayCardState extends State<NewsOfDayCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgColor,
      ),
      child: Stack(
        children: [
          Container(
            height: size.height * 0.5,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  "https://i.postimg.cc/sgBFfbkY/audience-on-music-notes-background-0610-min.jpg",
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
            ),
            child: Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.1,
                  bottom: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05,
                        // bottom: MediaQuery.of(context).size.height * 0.01,
                        // top: MediaQuery.of(context).size.height * 0.01,
                      ),
                      height: 50,
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: const Center(
                          child: Text(
                        "News of the day",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "First Version of Prometeo'23 App released on Play Store",
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // LearnMore(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LearnMore extends StatelessWidget {
  const LearnMore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Learn More",
          maxLines: 3,
          style: TextStyle(
            color: cyan,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Icon(
          Icons.arrow_forward,
          color: cyan,
          size: 14,
        ),
      ],
    );
  }
}
