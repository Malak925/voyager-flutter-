import 'package:flutter/material.dart';
import 'package:voyager/screens/tripPage.dart';

class JoinTrip extends StatefulWidget {
  const JoinTrip({super.key});

  @override
  State<JoinTrip> createState() => _JoinTripState();
}

class _JoinTripState extends State<JoinTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 153, 183),
        title: Text(
          "Tell Me about the trip",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.purple,
            fontSize: 40,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: SweepGradient(colors: [
          Color.fromARGB(255, 162, 0, 187),
          Color.fromARGB(255, 230, 141, 171),
          Colors.purple,
          Color.fromARGB(255, 230, 141, 171),
          Color.fromARGB(255, 167, 0, 193),
        ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'Code',
                  icon: Icon(Icons.trip_origin_rounded),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  fillColor: Colors.white),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TripPage();
                }));
              },
              child: Text("Join"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            )
          ],
        ),
      ),
    );
  }
}
