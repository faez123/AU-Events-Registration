import 'dart:convert';

import 'package:au_events_registration/constants/colors.dart';
import 'package:au_events_registration/utils/events/eventclass.dart';
import 'package:au_events_registration/widgets/events/tabbareventsview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List<Event> events = [];
  List<Event> pastEvents = [];
  List<Event> futureEvents = [];

  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("assets/events.json");
  }

  Future getEvents() async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = jsonDecode(jsonString);
    List eventList = jsonResponse["events"];
    for (int i = 0; i < eventList.length; i++) {
      setState(() {
        events.add(Event(
          eventList[i]["name"],
          eventList[i]["description"],
          eventList[i]["pictureURL"],
          eventList[i]["pageURL"],
          eventList[i]["date"],
        ));
      });
    }
  }

  void formatDateTime() {
    for (int i = 0; i < events.length; i++) {
      events[i].date = DateTime.parse(events[i].date);
    }
  }

  void filterEvents() {
    DateTime now = DateTime.now();
    for (int i = 0; i < events.length; i++) {
      if (now.compareTo(events[i].date) < 0) {
        futureEvents.add(events[i]);
      } else {
        pastEvents.add(events[i]);
      }
    }
  }

  void fixDateFormat() {
    for (int i = 0; i < pastEvents.length; i++) {
      pastEvents[i].dateTimeToString();
    }
    for (int i = 0; i < futureEvents.length; i++) {
      futureEvents[i].dateTimeToString();
    }
    setState(() {
      futureEvents;
      pastEvents;
    });
  }

  void asyncMethod() async {
    await getEvents();
    formatDateTime();
    filterEvents();
    fixDateFormat();
  }

  @override
  void initState() {
    super.initState();
    asyncMethod();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ahliaRed,
          title: const Text(
            'Events',
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Past"),
              Tab(text: "Future"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TabBarEventsView(events: pastEvents, isPassed: true),
            TabBarEventsView(events: futureEvents),
          ],
        ),
      ),
    );
  }
}
