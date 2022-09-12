import 'package:flutter/material.dart';
import 'package:voyager/screens/Main_page.dart';
import 'package:voyager/screens/sign_in.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'AmaticSC-Bold',
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 153, 183),
        title: Text(
          "Voyager",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.purple,
            fontSize: 40,
          ),
        ),
      ),
      drawer: Drawer(backgroundColor: Color.fromARGB(255, 247, 145, 179)),
      body: Container(
        decoration: BoxDecoration(
            gradient: SweepGradient(colors: [
          Color.fromARGB(255, 162, 0, 187),
          Color.fromARGB(255, 230, 141, 171),
          Colors.purple,
          Color.fromARGB(255, 230, 141, 171),
          Color.fromARGB(255, 167, 0, 193),
        ])),
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(0),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(gapPadding: 10),
                filled: true,
                fillColor: Colors.white,
                // contentPadding: EdgeInsets.symmetric(horizontal: 180),

                // border: InputBorder.none,
                hintText: 'Email',
                labelText: 'voyager',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(gapPadding: 10),
                filled: true,
                fillColor: Colors.white,
                // contentPadding: EdgeInsets.symmetric(horizontal: 180),

                // border: InputBorder.none,
                hintText: 'Password',
                labelText: 'Your Key',
              ),
            ),
            TextButton.icon(
              onPressed: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MainPage();
                  }));
                });
              },
              icon: Icon(
                Icons.login,
                color: Colors.purple,
              ),
              label: Text(
                "login",
                style: TextStyle(color: Color.fromARGB(255, 245, 206, 252)),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignIn();
                  }));
                });
              },
              icon: Icon(
                Icons.app_registration,
                color: Colors.purple,
              ),
              label: Text(
                "Dont Have an Acount? sign in",
                style: TextStyle(color: Color.fromARGB(255, 245, 206, 252)),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
