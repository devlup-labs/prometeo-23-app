import 'package:flutter/material.dart';

class TeamGrid extends StatelessWidget {
  const TeamGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .5, mainAxisSpacing: 20), 
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: const BoxDecoration(  
                      image: DecorationImage(  
                        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1DZz18gKC3Vb5yjw6WhbeITtKPGuTF45yp6U-GeU&s'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(  
                        colors: [
                          Colors.black,
                          Colors.transparent
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0.0, 0.5]
                      )
                    )
                  ),

                  Positioned(
                    bottom: 10,
                    left: 10, 
                    right: 10,
                    child: Row(  
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(  
                          icon: const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          onPressed:(){},
                        ),
                        IconButton(  
                          icon: const Icon(
                            Icons.email,
                            color: Colors.white
                          ),
                          onPressed:(){},
                        ),
                        IconButton(  
                          icon: const Icon(
                            Icons.email,
                            color: Colors.white
                          ),
                          onPressed:(){},
                        ),                      ]
                    )
                  )
                ],
              ),

              const SizedBox(height: 10),
              const Text(
                'Kunal Tiwari',
                style: TextStyle(  
                  fontSize: 18,
                  color: Colors.white,
                )
                ),
              const Text(
                'Sexy Boy',
                style: TextStyle(
                  color: Colors.grey
                ),)
            ],
          ),
        );
      }
      );
  }
}