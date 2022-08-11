import 'package:app_emi/constants.dart';
import 'package:app_emi/screens/Welcome/WelcomePlay_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  void handleNavigationPressPlay(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => WelcomePlay_page(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Text(
                  "Bienvenido",
                  style: TextStyle(
                      fontSize: bigFont,
                      fontWeight: FontWeight.w700,
                      color: secondaryColor),
                ),
                const SizedBox(height: 10),
                const Text(
                  namePageHome,
                  style: TextStyle(
                      fontSize: semiSmallFont,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor),
                ),
                const Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(80)),
                      gradient: secondaryGradient,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(5, 10),
                            blurRadius: 10,
                            color: boxShadowColor.withOpacity(0.2)),
                      ]),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 25, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Vision",
                          style: TextStyle(
                            fontSize: smallFont,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          visionPage,
                          style: TextStyle(
                            fontSize: semiSmallFont,
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(80)),
                      gradient: secondaryGradient,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(5, 10),
                            blurRadius: 10,
                            color: boxShadowColor.withOpacity(0.2)),
                      ]),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 25, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Mision",
                          style: TextStyle(
                            fontSize: smallFont,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          misionPage,
                          style: TextStyle(
                            fontSize: semiSmallFont,
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => Get.to(WelcomePlay_page()),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(defaultPadding * 0.75),
                    decoration: BoxDecoration(
                      gradient: primaryGradient,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "comienza el juego",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
