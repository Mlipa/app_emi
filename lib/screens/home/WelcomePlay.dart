import 'package:app_emi/utils/constants.dart';
import 'package:app_emi/screens/play/FirstPlay_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePlay extends StatefulWidget {
  const WelcomePlay({super.key});

  @override
  State<WelcomePlay> createState() => _WelcomePlayState();
}

class _WelcomePlayState extends State<WelcomePlay> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "¿Estas listo para empezar el juego?",
              style: TextStyle(
                  fontSize: bigFont,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 120.0,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(0, 82, 212, 1),
                    Color.fromRGBO(67, 100, 247, 1),
                    Color.fromRGBO(111, 177, 252, 1),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "PlayQuiz",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'responde las preguntas',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () => Get.off(const FirstPlay_page()),
                    child: Container(
                      alignment: Alignment.center,
                      width: 80.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white),
                      child: const Text(
                        'Jugar',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
