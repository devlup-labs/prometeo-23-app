import 'package:flutter/material.dart';
import 'package:prometeo23/widgets/app_bar.dart';
import 'package:prometeo23/widgets/events_banner.dart';
import 'package:prometeo23/widgets/new_event_card.dart';

import '../api/fetchEvents.dart';

class EventsPage extends StatefulWidget {
  final List eventList;
  const EventsPage({required this.eventList, super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff061417),
      body: CustomScrollView(slivers: [
        SliverAppBar(
            pinned: true,
            backgroundColor: Colors.black,
            expandedHeight: MediaQuery.of(context).size.height * 0.35,
            title: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.016),
                child: const CustomAppBar()),
            flexibleSpace: const FlexibleSpaceBar(background: EventBanner()),
            bottom: PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.05),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
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
                      child: const Text('Technical Events',
                          style: TextStyle(fontSize: 20, color: Colors.white))),
                ))),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: widget.eventList.length, (context, index) {
          return NewEventCard(
              eventName: widget.eventList[index].name,
              eventDate: widget.eventList[index].date,
              eventPrize: widget.eventList[index].prizeMoney,
              imageLink: widget.eventList[index].image);
        }))
      ]),
    );
  }
}
