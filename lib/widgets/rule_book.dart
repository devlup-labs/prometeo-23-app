import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RuleBookWidget extends StatefulWidget {
  String ruleBookLink;

  RuleBookWidget({
    required this.ruleBookLink,
    super.key,
  });

  @override
  State<RuleBookWidget> createState() => _RuleBookWidgetState();
}

class _RuleBookWidgetState extends State<RuleBookWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
          ),
          child: Text(
            "Rule Book",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () async {
            Uri url = Uri.parse(widget.ruleBookLink);
            if (await canLaunchUrl(url))
              await launchUrl(
                url,
                mode: LaunchMode.externalApplication,
              );
            else
              throw "Could not launch $url['url']";
          },
          child: Container(
            width: size.width * 0.9,
            height: size.height / 14,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            decoration: BoxDecoration(
              color: Color(0xff575B5e),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                "Open Rule Book",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}