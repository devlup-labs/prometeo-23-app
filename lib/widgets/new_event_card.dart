import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class NewEventCard extends StatelessWidget {
  final imageLink;
  const NewEventCard({required this.imageLink, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(imageLink),
                fit: BoxFit.cover)),
        child: Stack(children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GlassmorphicContainer(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.085,
                borderRadius: 20,
                blur: 10,
                border: 0,
                linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.1),
                      const Color(0xFFFFFFFF).withOpacity(0.05),
                    ],
                    stops: const [
                      0.1,
                      1,
                    ]),
                borderGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFFffffff).withOpacity(0.5),
                    const Color((0xFFFFFFFF)).withOpacity(0.5),
                  ],
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Event Name',
                            ),
                            Text('Event Dates')
                          ]),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Prizes fo rthe event '))
                    ])),
          ),
          Positioned(
            top: 30,
            right: 30,
            child: GlassmorphicContainer(
              padding: const EdgeInsets.all(25),
              width: 100,
              height: 100,
              blur: 10,
              border: 0,
              borderRadius: 25,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFFffffff).withOpacity(0.1),
                    const Color(0xFFFFFFFF).withOpacity(0.05),
                  ],
                  stops: const [
                    0.1,
                    1,
                  ]),
              borderGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFFffffff).withOpacity(0.1),
                    const Color(0xFFFFFFFF).withOpacity(0.05),
                  ],
                  stops: const [
                    0.1,
                    1,
                  ]),

                  child: const Center(
                    child: Text(  
                      'Event date',
                    ),
                  )
            ),
          )
        ]));
  }
}
