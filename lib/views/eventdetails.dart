import 'package:au_events_registration/constants/colors.dart';
import 'package:au_events_registration/utils/events/eventclass.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetails extends StatefulWidget {
  final Event event;

  const EventDetails({
    super.key,
    required this.event,
  });

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 5.0,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 6.0,
                  left: 60.0,
                ),
                child: SizedBox(
                  width: 250,
                  child: AutoSizeText(
                    widget.event.name,
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200,
            width: screenWidth,
            child: Image.network(
              alignment: Alignment.center,
              widget.event.pictureURL,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 15.0,
              left: 10.0,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              "Date:${widget.event.date}",
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(
              top: 20.0,
              left: 10.0,
            ),
            child: const Text(
              "Description:",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0),
            width: screenWidth - 20.0,
            child: Text(widget.event.description),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ahliaRed,
                elevation: 0,
              ),
              onPressed: () {
                _launchUrl(
                  Uri.parse(widget.event.pageURL),
                );
              },
              child: const Text('See more details'),
            ),
          )
        ],
      ),
    );
  }
}
