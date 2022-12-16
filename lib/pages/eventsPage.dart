import 'package:flutter/material.dart';
import 'package:prometeo23/pages/event.dart';
import 'package:prometeo23/widgets/app_bar.dart';
import 'package:prometeo23/widgets/events_banner.dart';
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
                      child: Text(widget.eventType,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white))),
                ))),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: widget.eventList.length, (context, index) {
          return GestureDetector(
            onTap: ()=> MaterialPageRoute(   
              builder: (context) => Event(eventName: widget.eventList[index].name, eventDate: widget.eventList[index].date, eventTime: widget.eventList[index].time, eventDescription: widget.eventList[index].description, imageLink: widget.eventList[index].image, sponsorLink: widget.eventList[index].sponsor, isSpeaker: widget.eventList[index].isSpeaker, ruleBookLink: widget.eventList[index].rulebookLink, unstopLink: widget.eventList[index].unstopLink, eventLocation: widget.eventList[index].venue, eventPrize: widget.eventList[index].pprize)
            ),
            child: NewEventCard(
                eventName: widget.eventList[index].name,
                eventDate: widget.eventList[index].date,
                eventPrize: widget.eventList[index].prizeMoney,
                imageLink: widget.eventList[index].image),
          );
        }))
      ]),
    );
  }
}
