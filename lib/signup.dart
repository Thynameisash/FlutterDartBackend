import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryc = Color(0xFF1b1c1f);
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryc,
        centerTitle: true,
        title: const Text("Form"),
      ),
      body: FormLayout(width: width),
    );
  }
}

class FormLayout extends StatefulWidget {
  const FormLayout({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  State<FormLayout> createState() => _FormLayoutState();
}

class _FormLayoutState extends State<FormLayout> {
  TextEditingController fnamectr = TextEditingController();
  TextEditingController emailctr = TextEditingController();
  TextEditingController pwdctr = TextEditingController();
  TextEditingController cpwdctr = TextEditingController();
  CollectionReference basic = FirebaseFirestore.instance.collection('basic');
  addInfo() {
    return basic
        .add({
          "fname": fnamectr.text,
          "email": emailctr.text,
        })
        .then((value) => print("Info Added:\n${value}"))
        .catchError((error) => print("Failed to add user: $error"));
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            const Text(
              "Fill Your Details",
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                width: widget.width,
                child: Row(
                  children: [
                    SizedBox(
                      width: widget.width * 0.33,
                      child: const Text(
                        "Full Name : ",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                          width: widget.width * 0.45,
                          child: TextField(
                            controller: fnamectr,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: widget.width,
              child: Row(
                children: [
                  SizedBox(
                    width: widget.width * 0.33,
                    child: const Text(
                      "Email : ",
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                        width: widget.width * 0.45,
                        child: TextField(
                          controller: emailctr,
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: widget.width,
              child: Row(
                children: [
                  SizedBox(
                    width: widget.width * 0.33,
                    child: const Text(
                      "Password : ",
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                        width: widget.width * 0.45,
                        child: TextField(
                          controller: pwdctr,
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: widget.width,
              child: Row(
                children: [
                  SizedBox(
                    width: widget.width * 0.33,
                    child: const Text(
                      "Confirm Password : ",
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                        width: widget.width * 0.45,
                        child: TextField(
                          controller: cpwdctr,
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        addInfo();
                      },
                      child: const Text("SOOBMIT")),
                  ElevatedButton(
                      onPressed: () {
                        fnamectr.clear();
                        emailctr.clear();
                        pwdctr.clear();
                        cpwdctr.clear();
                      },
                      child: const Text("Clear"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
