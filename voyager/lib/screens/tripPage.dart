import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';

import 'package:voyager/models/urlModels.dart';
import 'package:voyager/screens/Bills.dart';
import 'package:voyager/screens/Main_page.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:voyager/screens/Share.dart';
import 'package:voyager/screens/TripDetails.dart';
import 'package:voyager/screens/UploadImage.dart';
import 'package:voyager/screens/comment.dart';
import 'package:voyager/screens/history.dart';
import 'package:voyager/screens/participants.dart';
import 'package:voyager/screens/profile.dart';

class TripPage extends StatefulWidget {
  const TripPage({super.key});

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  final currentUser = FirebaseAuth.instance;
  String email = "r";
  String phoneNum = "t";
  String name = "one";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  UrlLauncher.launch("tel://911");
                },
                icon: Icon(
                  Icons.call,
                  color: Colors.red,
                ))
          ],
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
          child: Stack(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .where("uid", isEqualTo: currentUser.currentUser!.uid)
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        QueryDocumentSnapshot x = snapshot.data!.docs[index];
                        return Container(
                            child: DrawerHeader(
                          child: Column(children: [
                            Image.network(
                              "https://flyclipart.com/thumb2/purple-camera-clip-art-594601.png",
                              width: 50,
                              height: 50,
                            ),
                            Text(x['Email']),
                            Text(x['Name']),
                            Text(x['phone'])
                          ]),
                        ));
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              // DrawerHeader(
              //     child: Column(
              //   children: [

              //     Text(name),
              //     Text(email),
              //     Text(phoneNum)
              //   ],
              // )),
              Positioned(
                top: 200,
                child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Profile();
                      }));
                    });
                  },
                  icon: Icon(
                    Icons.person,
                    color: Colors.purple,
                  ),
                  label: Text(
                    "Profile",
                    style: TextStyle(color: Color.fromARGB(255, 245, 206, 252)),
                  ),
                ),
              ),
              Positioned(
                top: 250,
                child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return History();
                      }));
                    });
                  },
                  icon: Icon(
                    Icons.history,
                    color: Colors.purple,
                  ),
                  label: Text(
                    "Old trips",
                    style: TextStyle(color: Color.fromARGB(255, 245, 206, 252)),
                  ),
                ),
              ),
              Positioned(
                top: 300,
                child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Comment_on_trip();
                      }));
                    });
                  },
                  icon: Icon(
                    Icons.comment,
                    color: Colors.purple,
                  ),
                  label: Text(
                    "Comment On trip",
                    style: TextStyle(color: Color.fromARGB(255, 245, 206, 252)),
                  ),
                ),
              ),
              Positioned(
                top: 350,
                child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Are you Sure you want to end trip?"),
                              content: Row(children: [
                                TextButton(
                                  onPressed: () {
                                    read_data();
                                  },
                                  child: Text("Yes"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("No"),
                                )
                              ]),
                            );
                          });
                    });
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.purple,
                  ),
                  label: Text(
                    "End trip",
                    style: TextStyle(color: Color.fromARGB(255, 245, 206, 252)),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Positioned(
                top: 600,
                child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
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
            ],
          ),
        ),
        body: TabBarView(children: [
          TripDetails(),
          Participants(),
          UploadImage(),
          Bills(),
          Share(),
        ]),
      ),
    );
  }

  read_data() async {}
}
