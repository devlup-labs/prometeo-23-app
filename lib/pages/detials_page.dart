import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:prometeo23/constants.dart';


class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Container(  
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(image: DecorationImage(image: NetworkImage('http://prometeo.rahulgopathi.tech/media/images/Inderpal_Bhandari_HD_1-compressed.jpg'),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter
            ),),

          ),

          const SizedBox(height: 20.0),

          FadeInLeft(
            delay: const Duration(milliseconds: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Inderpal Bhandari', style: TextStyle(
                    color: titleColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
          
                SizedBox(height: 10.0),
          
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Founder and CEO of The Bhandari Group of Companies', style: TextStyle(
                    color: textColor,
                    fontSize: 20.0,
                  ),
                  ),
                ),
          
                SizedBox(height: 20.0),
          
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('About the Speaker', style: TextStyle(
                    color: titleColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
          
                SizedBox(height: 10.0),
          
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Lorem ipsum dolor sit amet. Et exercitationem suscipit est dolores galisum cum omnis amet sit voluptatem quam quo accusamus eveniet. Est quia galisum ea nisi sequi vel accusantium officiis.',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 15,
                    ),
                ), 
                ),
              ],
            ),
          )


        ],
      ),
    );
  }
}