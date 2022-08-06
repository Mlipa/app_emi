import 'dart:html';

import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: Column(
            children: [
              Text(
                "Bienvenido a",
              )
            ],
          ))
        ],
      ),
    );
  }
}
