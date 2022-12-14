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
              background: Container(color: Colors.pink)
            ),
          ),
          SliverList(
            delegate:  SliverChildBuilderDelegate(
              childCount: 100,
              (context, index){
                return Container( 
                  color: Colors.blue,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
                  child: Row(  
                    children: [  
                      Image.network(
                        'https://img.freepik.com/free-vector/robot-android-realistic-3d-composition-with-artificial-support-agent-cybernetic-anthropomorphous-machine-with-feminine-apperance_1284-28638.jpg?w=740&t=st=1671022118~exp=1671022718~hmac=8f4201ccec37f2245e044c4da950ed5c7ced41121d765f0f267a68c7817bf143',
                        width: 100,
                        fit: BoxFit.cover
                      ),
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