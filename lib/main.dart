import 'package:au_events_registration/widgets/ahlianavbar/ahlianavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AhliaNavBar(),
    );
  }
}
