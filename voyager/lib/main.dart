import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:voyager/screens/Main_page.dart';
import 'package:voyager/screens/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
  bool pass = true;
  TextEditingController email = TextEditingController();
  TextEditingController passcnt = TextEditingController();

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
              controller: email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(gapPadding: 10),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Email',
                  labelText: 'voyager',
                  prefixIcon: Icon(Ionicons.people)),
            ),
            TextField(
              controller: passcnt,
              decoration: InputDecoration(
                border: OutlineInputBorder(gapPadding: 10),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Password',
                labelText: 'Your Key',
                prefixIcon: Icon(Ionicons.lock_closed),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      if (pass == true) {
                        pass = false;
                      } else {
                        pass = true;
                      }
                    });
                  },
                  icon: Icon(Ionicons.eye),
                ),
              ),
              obscureText: pass,
            ),
            TextButton.icon(
              onPressed: () async {
                try {
                  var authobj = FirebaseAuth.instance;
                  UserCredential myVoyager =
                      await authobj.signInWithEmailAndPassword(
                          email: email.text, password: passcnt.text);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("welcome!")));
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MainPage();
                  }));
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Try again!")));
                }
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
