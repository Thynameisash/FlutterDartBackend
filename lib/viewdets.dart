import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasebasic/info.dart';
import 'package:flutter/material.dart';

class ViewDets extends StatelessWidget {
  const ViewDets({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryc = Color(0xFF1b1c1f);
    var firebaseinstance =
        FirebaseFirestore.instance.collection("basic").snapshots();
    var db = FirebaseFirestore.instance.collection("basic");
    // print(firebaseinstance.id);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryc,
          centerTitle: true,
          title: const Text("Details"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: firebaseinstance,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Error Occured!");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Fetchinggggg!");
            }
            List docidd = [];
            List<Info> infodata = snapshot.data!.docs.map((ele) {
              docidd.add(ele.id);
              return Info.fromMap(ele.data() as Map<String, dynamic>);
            }).toList();
            return ListView.builder(
              itemCount: infodata.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onDoubleTap: () {
                    (db.doc(docidd[index]).delete());
                  },
                  child: FilledCardExample(
                    textinfo: infodata[index].fname,
                  ),
                );
              },
            );
          },
        ));
  }
}

class FilledCardExample extends StatelessWidget {
  const FilledCardExample({super.key, required this.textinfo});
  final String textinfo;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        color: Colors.green.shade100,
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text(textinfo)),
        ),
      ),
    );
  }
}
