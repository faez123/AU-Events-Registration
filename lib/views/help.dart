import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Image.network(
        "https://risibank.fr/cache/medias/0/28/2816/281692/full.gif",
        height: screenHeight,
        width: screenWidth,
      ),
    );
  }
}
