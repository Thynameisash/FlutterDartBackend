import 'package:firebase_core/firebase_core.dart';
import 'package:firebasebasic/signup.dart';
import 'package:firebasebasic/viewdets.dart';
import 'package:firebasebasic/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const primaryc = Color(0xFF1b1c1f);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const ListItem(),
        appBar: AppBar(
          backgroundColor: primaryc,
          title: const Center(child: Text("Main Menu")),
        ),
      ),
    );
  }
}

class ListItem extends StatefulWidget {
  const ListItem({
    Key? key,
  }) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 80, left: 50, right: 50),
      children: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.amber[500])),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUp()),
            );
          },
          child: SizedBox(
            height: 50,
            // color: const Color.fromARGB(255, 223, 248, 0),
            child: Center(
              child: Text(
                'Sign-Up',
                style: GoogleFonts.lobster(
                  textStyle: const TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 50)),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ViewDets()));
          },
          child: Container(
            height: 50,
            color: const Color.fromARGB(255, 0, 153, 248),
            child: Center(
              child: Text(
                'View Details',
                style: GoogleFonts.lobster(
                  textStyle: const TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 50)),
        Container(
          height: 50,
          color: const Color.fromARGB(255, 0, 153, 248),
          child: Center(
            child: Text(
              'Sign In',
              style: GoogleFonts.lobster(
                textStyle: const TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        // const Padding(padding: EdgeInsets.only(top: 50)),
        // Container(
        //   height: 50,
        //   color: const Color.fromARGB(255, 0, 153, 248),
        //   child: const Center(child: Text('Entry C')),
        // ),
        // const Padding(padding: EdgeInsets.only(top: 50)),
        // Container(
        //   height: 50,
        //   color: const Color.fromARGB(255, 0, 153, 248),
        //   child: const Center(child: Text('Entry C')),
        // ),
        // const Padding(padding: EdgeInsets.only(top: 50)),
        // Container(
        //   height: 50,
        //   color: const Color.fromARGB(255, 0, 153, 248),
        //   child: const Center(child: Text('Entry C')),
        // ),
        // const Padding(padding: EdgeInsets.only(top: 50)),
        // Container(
        //   height: 50,
        //   color: const Color.fromARGB(255, 0, 153, 248),
        //   child: const Center(child: Text('Entry C')),
        // ),
        // const Padding(padding: EdgeInsets.only(top: 50)),
        // Container(
        //   height: 50,
        //   color: const Color.fromARGB(255, 0, 153, 248),
        //   child: const Center(child: Text('Entry C')),
        // ),
        // const Padding(padding: EdgeInsets.only(top: 50)),
        // Container(
        //   height: 50,
        //   color: const Color.fromARGB(255, 0, 153, 248),
        //   child: const Center(child: Text('Entry C')),
        // ),
        // const Padding(padding: EdgeInsets.only(top: 50)),
        // Container(
        //   height: 50,
        //   color: const Color.fromARGB(255, 0, 153, 248),
        //   child: const Center(child: Text('Entry C')),
        // ),
        // const Padding(padding: EdgeInsets.only(top: 50)),
        // Container(
        //   height: 50,
        //   color: const Color.fromARGB(255, 0, 153, 248),
        //   child: const Center(child: Text('Entry C')),
        // ),
      ],
    );
  }
}
