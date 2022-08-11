import 'package:app_emi/constants.dart';
import 'package:app_emi/screens/Play/FirstPlay_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WelcomePlay_page extends StatelessWidget {
  const WelcomePlay_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // fit: StackFit.expand,
        children: [
          // Positioned.fill(
          //   child: WebsafeSvg.asset("assets/icons/bg.svg"),
          // ),
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),
                const Text(
                  "¿Estas listo para empezar el juego?",
                  style: TextStyle(
                      fontSize: bigFont,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 10),
                const Text(
                  "responde las preguntas",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: semiSmallFont,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                const TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: "introduce tu nombre",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => Get.to(FirstPlay_page()),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(defaultPadding * 0.75),
                    decoration: const BoxDecoration(
                        gradient: primaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: const Text(
                      "Vamos a iniciar",
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
