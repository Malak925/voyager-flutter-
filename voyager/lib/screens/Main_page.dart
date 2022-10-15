import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:voyager/main.dart';
import 'package:voyager/screens/generateCode.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 245, 153, 183),
          title: Text(
            "Lets Go! Voyager",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purple,
              fontSize: 40,
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 247, 145, 179),
          child: Column(
            children: [
// var docRef = db.collection("users").doc(doc.id);

// // Source can be CACHE, SERVER, or DEFAULT.
// const source = Source.cache;

// docRef.get(const GetOptions(source: source)).then(
//       (res) => print("Successfully completed"),
//       onError: (e) => print("Error completing: $e"),
//     );

              TextButton.icon(
                onPressed: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MyApp();
                    }));
                  });
                },
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.purple,
                ),
                label: Text(
                  "Exit",
                  style: TextStyle(color: Color.fromARGB(255, 245, 206, 252)),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          width: 600,
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
              TextButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return GenerateCode();
                    }));
                  },
                  icon: Icon(
                    Icons.create,
                    color: Colors.purple,
                  ),
                  label: Text(
                    "Create a trip",
                    style: TextStyle(fontSize: 50),
                  )),
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.join_full,
                    color: Colors.purple,
                  ),
                  label: Text(
                    "Join a trip",
                    style: TextStyle(fontSize: 50),
                  ))
            ],
          ),
        ));
  }
}
