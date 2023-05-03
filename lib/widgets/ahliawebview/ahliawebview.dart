import 'package:au_events_registration/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _urlPastAndFutureEvents =
    Uri.parse('https://www.ahlia.edu.bh/au-events/');
final Uri _urlAhliaWebsite = Uri.parse('https://www.ahlia.edu.bh/');
final Uri _urlAhliaBestTeacher =
    Uri.parse('https://www.ahlia.edu.bh/faculty/dr-suresh-subramanian/');

class AhliaWebSite extends StatefulWidget {
  const AhliaWebSite({super.key});

  @override
  State<AhliaWebSite> createState() => _AhliaWebSiteState();
}

class _AhliaWebSiteState extends State<AhliaWebSite> {
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ahlia Website"),
        backgroundColor: ahliaRed,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ahliaRed,
                elevation: 0,
              ),
              onPressed: () {
                _launchUrl(_urlAhliaWebsite);
              },
              child: const Text('Go to Ahlia Website'),
            ),
          ),
          const SizedBox(height: 20.0),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ahliaRed,
                elevation: 0,
              ),
              onPressed: () {
                _launchUrl(_urlPastAndFutureEvents);
              },
              child: const Text('Show Past and Future Events'),
            ),
          ),
          const SizedBox(height: 20.0),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ahliaRed,
                elevation: 0,
              ),
              onPressed: () {
                _launchUrl(_urlAhliaBestTeacher);
              },
              child: const Text('Click to see Ahlia\'s best teacher!'),
            ),
          ),
        ],
      ),
    );
  }
}
