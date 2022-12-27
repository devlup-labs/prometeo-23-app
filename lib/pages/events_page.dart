import 'package:flutter/material.dart';
import 'package:prometeo23/widgets/events_banner.dart';
import 'package:prometeo23/widgets/nav_drawer.dart';
import 'package:prometeo23/widgets/new_event_card.dart';

class EventsPage extends StatefulWidget {
  final List eventList;
  final String eventType;
  const EventsPage(
      {required this.eventType, required this.eventList, super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      backgroundColor: const Color(0xff061417),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: Colors.black,
          expandedHeight: MediaQuery.of(context).size.height * 0.35,
          flexibleSpace: const FlexibleSpaceBar(
            background: EventBanner(),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(
              MediaQuery.of(context).size.height * 0.05,
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        blurRadius: 20,
                        spreadRadius: -10,
                        offset: const Offset(-5, -5),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        spreadRadius: -10,
                        offset: const Offset(7, 7),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(widget.eventType,
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white))),
            ),
          ),
        ),
        SliverGrid(  
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.8,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => NewEventCard(
              imageLink: widget.eventList[index].image
            )
          )
        )
      ]),
    );
  }
}
