import 'package:flutter/material.dart';
import 'package:voyager/screens/generateCode.dart';

class TripCreation extends StatefulWidget {
  const TripCreation({super.key});

  @override
  State<TripCreation> createState() => _TripCreationState();
}

class _TripCreationState extends State<TripCreation> {
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
                  hintText: 'Trip name',
                  icon: Icon(Icons.trip_origin_rounded),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  fillColor: Colors.white),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Cpacity',
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  fillColor: Colors.white),
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Discription',
                  icon: Icon(Icons.comment),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  fillColor: Colors.white),
              maxLines: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.location_on)),
                SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return GenerateCode();
                      }));
                    },
                    child: Text("Generate Code"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
