import 'package:flutter/material.dart';

class EntrepreneuralEventsScreen extends StatelessWidget {
  const EntrepreneuralEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff061417),
      body: CustomScrollView(  
        slivers: [  
          SliverAppBar( 
            backgroundColor: Color(0xff061417), 
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            flexibleSpace: FlexibleSpaceBar(  
              background: Image.asset(
                'assets/Rectangle 62.png',
                width: double.maxFinite,
                fit: BoxFit.cover
              ),
            ),
          ),
          SliverList(
            delegate:  SliverChildBuilderDelegate(
              childCount: 100,
              (context, index){
                return Container( 
                  padding: const EdgeInsets.symmetric(horizontal: 10), 
                  height: 50,
                  child: Row(  
                    children: [  
                      Icon(Icons.home),
                      const SizedBox(width: 15),
                      Column(  
                        children: [  
                          Text('something'), 
                          Text('something ')
                        ]
                      )
                    ]
                  )
                );
              }
            ),
          )

        ]
      )
    );
  }
}