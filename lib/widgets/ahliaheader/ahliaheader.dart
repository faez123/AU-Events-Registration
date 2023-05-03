import 'package:flutter/material.dart';

class AhliaHeader extends StatefulWidget {
  const AhliaHeader({super.key});

  @override
  State<AhliaHeader> createState() => _AhliaHeaderState();
}

class _AhliaHeaderState extends State<AhliaHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 75,
          width: 75,
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(
            left: 15.0,
            top: 10.0,
          ),
          child: Image.network(
            'https://media.glassdoor.com/sqll/3178986/ahlia-university-squarelogo-1664352105510.png',
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 40.0,
            top: 5.0,
          ),
          child: const Text(
            "Ahlia University",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
