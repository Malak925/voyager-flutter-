import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:voyager/screens/Main_page.dart';
import 'package:voyager/screens/history.dart';
import 'package:voyager/screens/profile.dart';
import 'package:voyager/screens/tripPage.dart';

class Comment_on_trip extends StatefulWidget {
  const Comment_on_trip({super.key});

  @override
  State<Comment_on_trip> createState() => _Comment_on_tripState();
}

class _Comment_on_tripState extends State<Comment_on_trip> {
  TextEditingController comment = TextEditingController();
  TextEditingController comment_sub = TextEditingController();

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
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 247, 145, 179),
        child: Column(
          children: [
            DrawerHeader(
                child: Column(
              children: [
                Image.network(
                  "https://flyclipart.com/thumb2/purple-camera-clip-art-594601.png",
                  width: 50,
                  height: 50,
                ),
                Text("Name"),
                Text("Email"),
                Text("Phone Number")
              ],
            )),
            TextButton.icon(
              onPressed: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
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
            TextButton.icon(
              onPressed: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
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
            TextButton.icon(
              onPressed: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
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
            TextButton.icon(
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
                              onPressed: () {},
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
            SizedBox(
              height: 100,
            ),
            TextButton.icon(
              onPressed: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TripPage();
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
              controller: comment_sub,
              decoration: InputDecoration(
                  hintText: 'Subject',
                  icon: Icon(Icons.trip_origin_rounded),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  fillColor: Colors.white),
            ),
            TextField(
              controller: comment,
              decoration: InputDecoration(
                  hintText: 'Comment',
                  icon: Icon(Icons.comment),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  fillColor: Colors.white),
              maxLines: 7,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  FirebaseFirestore db = FirebaseFirestore.instance;

                  Map<String, dynamic> userInfo = {
                    "subject": comment_sub.text,
                    "comment": comment.text
                  };
                  db.collection("Comment").add(userInfo).then(
                      (DocumentReference doc) =>
                          print('DocumentSnapshot added with ID: ${doc.id}'));
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("comment added succecfully")));
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Try again!")));
                }
              },
              child: Text("Upload Comment"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            )
          ],
        ),
      ),
    );
  }
}
