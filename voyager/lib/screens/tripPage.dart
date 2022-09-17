import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:voyager/main.dart';
import 'package:voyager/screens/Main_page.dart';
import 'package:voyager/screens/generateCode.dart';
import 'package:voyager/screens/sign_in.dart';

class TripPage extends StatefulWidget {
  const TripPage({super.key});

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 245, 153, 183),
          title: Text(
            "The Voyage",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purple,
              fontSize: 40,
            ),
          ),
          // bottom: TabBar(tabs: [
          //   Tab(
          //     icon: Icon(
          //       Icons.people,
          //       color: Colors.purple,
          //     ),
          //     child: Container(),
          //   ),
          // ]),
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 247, 145, 179),
          child: TextButton.icon(
            onPressed: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MainPage();
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
            children: [],
          ),
        ));
  }
}
