import 'package:flutter/material.dart';

class TeamGrid extends StatelessWidget {
  const TeamGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .7), 
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(  
                  image: DecorationImage(  
                    image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1DZz18gKC3Vb5yjw6WhbeITtKPGuTF45yp6U-GeU&s'),
                    fit: BoxFit.cover
                  )
                ),
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
                  color: Colors.white
                ),)
            ],
          ),
        );
      }
      );
  }
}