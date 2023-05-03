import 'package:au_events_registration/constants/colors.dart';
import 'package:au_events_registration/utils/events/eventclass.dart';
import 'package:au_events_registration/views/eventdetails.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  final Event event;
  final bool isPassed;

  const EventCard({
    Key? key,
    required this.event,
    this.isPassed = false,
  }) : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetails(
              event: widget.event,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10.0),
        alignment: Alignment.centerLeft,
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: evenCardBackgroundColor,
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(left: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.isPassed
                  ? ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Colors.grey,
                        BlendMode.saturation,
                      ),
                      child: SizedBox(
                        child: Image.network(
                          height: 150.0,
                          width: 100.0,
                          widget.event.pictureURL,
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 150.0,
                      width: 100.0,
                      child: Image.network(
                        widget.event.pictureURL,
                      ),
                    ),
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                width: 180,
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      widget.event.name,
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.event.date.runtimeType == String
                          ? widget.event.date
                          : widget.event.getDateStringFormat(),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
