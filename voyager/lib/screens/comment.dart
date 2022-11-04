import 'package:flutter/material.dart';

class Comment_on_trip extends StatefulWidget {
  const Comment_on_trip({super.key});

  @override
  State<Comment_on_trip> createState() => _Comment_on_tripState();
}

class _Comment_on_tripState extends State<Comment_on_trip> {
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
                  hintText: 'Subject',
                  icon: Icon(Icons.trip_origin_rounded),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  fillColor: Colors.white),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Comment',
                  icon: Icon(Icons.comment),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  fillColor: Colors.white),
              maxLines: 7,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Upload Comment"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            )
          ],
        ),
      ),
    );
  }
}
