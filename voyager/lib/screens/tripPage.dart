// import 'dart:html';
// import 'dart:io';
// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
// import 'package:voyager/main.dart';
import 'package:voyager/models/urlModels.dart';
import 'package:voyager/screens/Main_page.dart';
// import 'package:voyager/screens/generateCode.dart';
// import 'package:voyager/screens/sign_in.dart';

class TripPage extends StatefulWidget {
  const TripPage({super.key});

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(
                Icons.info,
                color: Colors.purple,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.people,
                color: Colors.purple,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.photo_sharp,
                color: Colors.purple,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.money,
                color: Colors.purple,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.share,
                color: Colors.purple,
              ),
            ),
          ]),
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
        body: TabBarView(children: [
          Container(
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
                Text(
                  "Trip details",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                )
              ],
            ),
          ),
          Container(
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
                Text(
                  "people",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                )
              ],
            ),
          ),
          Container(
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
                Text(
                  "Uploud your picture",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ],
            ),
          ),
          Container(
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
                Text(
                  "bill",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                )
              ],
            ),
          ),
          Container(
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
                Text(
                  "share your trip code",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                URlClass(
                    myfunction: LancherURLf,
                    linkIcon: Ionicons.logo_facebook,
                    linkExp: "share your trip code",
                    linkTitle: "FaceBook"),
                URlClass(
                    myfunction: LancherURLI,
                    linkIcon: Ionicons.logo_instagram,
                    linkExp: "share your trip code",
                    linkTitle: "Instagram"),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
/*Container(
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
          )*/