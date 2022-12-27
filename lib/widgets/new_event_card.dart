import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class NewEventCard extends StatelessWidget {
  final String imageLink;
  final String eventName;
  final String eventPrize;
  final String eventDate;
  const NewEventCard({required this.imageLink, required this.eventName, required this.eventDate, required this.eventPrize, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageLink), 
                fit: BoxFit.cover,
                opacity: 0.5)),
        child: Stack(children: [
          Container(  
            decoration: const BoxDecoration(  
              gradient: LinearGradient(  
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black]
              )
            ),
          ),
          Positioned(
              left: 0,
              top: 30,
              child: Container(
                color: Colors.blue.withOpacity(0.4),  
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Center(
                  child: Text(
                    eventName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16
                    ),
                    )
                )
              )),

              Container(
                alignment: Alignment.bottomCenter,  
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      children: [
                        const Spacer(),
                        Column(  
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              eventPrize,
                              style: const TextStyle(  
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              )
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.calendar_month_rounded,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                Text(  
                                  eventDate,
                                  style: const TextStyle(  
                                    color: Colors.white,
                                  )
                                ),
                              ],
                            ),

                            TextButton(  
                              onPressed: (){},
                              style: TextButton.styleFrom(  
                                backgroundColor: const Color(0xff003959),
                                shape: RoundedRectangleBorder(  
                                  borderRadius: BorderRadius.circular(20)
                                )
                              ),
                              child: const Text(  
                                'Read More',
                                style: TextStyle(   
                                  color: Colors.white
                                )
                              ),

                            )
                          ]
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                )
              )
        ]));
  }
}
