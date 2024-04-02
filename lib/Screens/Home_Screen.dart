import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseproject/Services/Model_Class.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NamesModel> nameList = [];

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> getDataFromFireStore() async {
    final data = await _firebaseFirestore.collection("Human").get().then(
          (value) => {},
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Firestore Database",
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: StreamBuilder(
        stream: _firebaseFirestore.collection("Human").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            Center(
              child: Text(snapshot.error.toString()),
            );
          }
          nameList.clear();
          for (QueryDocumentSnapshot doc in (snapshot.data?.docs ?? [])) {
            nameList.add(NamesModel.fromJson(
                doc.data() as Map<String, dynamic>, doc.id));
          }

          return ListView.builder(
            itemCount: nameList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  nameList[index].name,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  nameList[index].address,
                  style: const TextStyle(fontSize: 22),
                ),
                trailing: Text(
                  nameList[index].age,
                  style: const TextStyle(fontSize: 22),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
