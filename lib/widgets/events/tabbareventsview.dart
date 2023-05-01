import 'package:au_events_registration/utils/events/eventclass.dart';
import 'package:au_events_registration/widgets/events/eventcard.dart';
import 'package:flutter/material.dart';

class TabBarEventsView extends StatefulWidget {
  final List<Event> events;
  final bool isPassed;

  const TabBarEventsView({
    super.key,
    required this.events,
    this.isPassed = false,
  });

  @override
  State<TabBarEventsView> createState() => _TabBarEventsViewState();
}

class _TabBarEventsViewState extends State<TabBarEventsView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.events.length,
            itemBuilder: ((context, index) {
              return Container(
                margin: EdgeInsets.only(
                  bottom: 15.0,
                  top: (index == 0 ? 10.0 : 0.0),
                ),
                child: EventCard(
                  event: widget.events[index],
                  isPassed: widget.isPassed,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
