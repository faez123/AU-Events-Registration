import "dart:convert";
import "package:au_events_registration/utils/events/eventclass.dart";
import "package:au_events_registration/widgets/ahliaheader/ahliaheader.dart";
import "package:au_events_registration/widgets/events/eventcard.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Event> events = [];

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

  void asyncMethod() async {
    await getEvents();
  }

  @override
  void initState() {
    super.initState();
    asyncMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AhliaHeader(),
        events.isEmpty
            ? Container()
            : Expanded(
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        bottom: 15.0,
                        top: (index == 0 ? 5.0 : 0.0),
                      ),
                      child: EventCard(
                        event: events[index],
                      ),
                    );
                  }),
                ),
              ),
      ],
    );
  }
}
