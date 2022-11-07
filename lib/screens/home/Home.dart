import 'package:app_emi/screens/publication/newsRelease.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../publication/publications.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Stream<QuerySnapshot> _collectionsNews =
      FirebaseFirestore.instance.collection('news').snapshots();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 16.0,
        right: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _collectionsNews,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  return ListView(
                    children: snapshot.data!.docs
                        .map((notice) => publications(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => newsRelease(notice),
                                  ));
                            }, notice))
                        .toList(),
                  );
                }
                return const Text('No se obtubieron los datos!');
              },
            ),
          ),
        ],
      ),
    );
  }
}
