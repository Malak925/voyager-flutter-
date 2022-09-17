import 'package:flutter/material.dart';
import 'package:voyager/main.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                TextField(
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MyApp();
                      }));
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
