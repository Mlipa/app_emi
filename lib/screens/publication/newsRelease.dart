import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class newsRelease extends StatefulWidget {
  newsRelease(this.notice, {super.key});
  QueryDocumentSnapshot notice;

  @override
  State<newsRelease> createState() => _newsReleaseState();
}

class _newsReleaseState extends State<newsRelease> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.notice['urlToImg']),
          fit: BoxFit.cover,
          opacity: 0.8,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.8),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(backgroundColor: Colors.transparent, actions: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(6),
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                  )),
            )
          ]),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.notice['title'].toString().toUpperCase(),
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.notice['author'],
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white54,
                  ),
                ),
                const SizedBox(height: 30),
                Text(widget.notice['title'],
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
