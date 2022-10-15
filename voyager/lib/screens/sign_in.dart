// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voyager/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:voyager/firebase_options.dart';
import 'package:image_picker/image_picker.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController name = TextEditingController();
  // Map <String,dynamic> user = {"Name":Text(""), "Phone Number": phone.text};
  File? image;
  Future _pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 245, 153, 183),
          title: Text(
            "Sign in",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purple,
              fontSize: 40,
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 247, 145, 179),
          child: TextButton.icon(
            onPressed: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
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
          child: ListView(children: [
            Column(
              children: [
                image != null
                    ? Image.file(
                        image!,
                        width: 200,
                        height: 200,
                      )
                    : Image.network(
                        "https://thumbs.dreamstime.com/b/man-icon-profile-member-user-perconal-symbol-vector-white-isolated-background-141728154.jpg",
                        width: 200,
                        height: 200,
                      ),
                TextButton.icon(
                  onPressed: () {
                    _pickImage();
                  },
                  label: Text(
                    "upload picture",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  icon: Icon(Icons.image),
                ),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(20),
                    hintText: 'Name',
                    label: Text(
                      "Voyager",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(20),
                    hintText: 'Voyager@gmail.com',
                    label: Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                TextField(
                  controller: phone,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(20),
                    hintText: '079000000',
                    label: Text(
                      "Phone Number",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                TextField(
                  controller: pass,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(20),
                    hintText: '*****',
                    label: Text(
                      "Password",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                  obscureText: true,
                ),
                TextButton.icon(
                    onPressed: () async {
                      try {
                        FirebaseFirestore db = FirebaseFirestore.instance;

                        var authobj = FirebaseAuth.instance;
                        UserCredential myVoyager =
                            await authobj.createUserWithEmailAndPassword(
                                email: email.text, password: pass.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("You Became a Voyager!")));
                        Map<String, dynamic> userInfo = {
                          "Name": name.text,
                          "phone": phone.text,
                          "Email": email.text,
                          "Password": pass.text,
                          // "picture": image,
                        };
                        db.collection("users").add(userInfo).then(
                            (DocumentReference doc) => print(
                                'DocumentSnapshot added with ID: ${doc.id}'));

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MyApp();
                        }));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Try again!")));
                      }
                    },
                    icon: Icon(
                      Icons.start,
                      color: Colors.purple,
                    ),
                    label: Text(
                      "Become a VOYAGER!",
                      style: TextStyle(fontSize: 30),
                    ))
              ],
            ),
          ]),
        ));
  }
}
