import 'package:flutter/material.dart';
import 'package:app_emi/screens/welcome/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App EMI',
      theme: ThemeData.dark(),
      home: Welcome(),
    );
  }
}
