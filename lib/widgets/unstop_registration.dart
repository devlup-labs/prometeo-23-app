import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo23/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class UnstopRegistration extends StatefulWidget {
  String unstopLink;

  UnstopRegistration({
    required this.unstopLink,
    super.key,
  });

  @override
  State<UnstopRegistration> createState() => _UnstopRegistrationState();
}

class _UnstopRegistrationState extends State<UnstopRegistration> {
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
          child: Text(
            "Registration",
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          width: size.width * 0.9,
          height: size.height / 14,
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
          ),
          decoration: BoxDecoration(
            color: Color(0xff003959),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextButton(
            onPressed: () async {
              Uri url = Uri.parse(widget.unstopLink);
              if (await canLaunchUrl(url))
                await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                );
              else
                throw "Could not launch $url['url']";
            },
            child: Text(
              "Register at Unstop",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
