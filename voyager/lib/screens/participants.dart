import 'package:flutter/material.dart';

class Participants extends StatelessWidget {
  const Participants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: SweepGradient(colors: [
          Color.fromARGB(255, 162, 0, 187),
          Color.fromARGB(255, 230, 141, 171),
          Colors.purple,
          Color.fromARGB(255, 230, 141, 171),
          Color.fromARGB(255, 167, 0, 193),
        ])),
        child: Center(
            child: Text(
          "Participants",
          style: TextStyle(color: Colors.white, fontSize: 40),
        )),
      ),
    );
  }
}
