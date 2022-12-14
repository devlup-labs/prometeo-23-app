import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prometeo23/widgets/events_banner.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff061417),
      body: CustomScrollView(  
        slivers: [
          const SliverAppBar(
            pinned: true,
            backgroundColor: Colors.black,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(  
              background: EventBanner()
            )
          ),
    
          SliverList(  
            delegate: SliverChildBuilderDelegate( 
              childCount: 10, 
              (context, index) {
                return Container(
                  margin: const EdgeInsets.all(12),
                  width: double.maxFinite,
                  height: 200,
                  color: Colors.blueGrey,
                  );
              }
            )
          )
        ]
      ),
    );
  }
}