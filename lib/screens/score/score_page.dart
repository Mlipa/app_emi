import 'package:app_emi/Home.dart';
import 'package:app_emi/constants.dart';
import 'package:app_emi/controllers/controllerQuestions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

class score_page extends StatelessWidget {
  const score_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controllerQuestions _qnController = Get.put(controllerQuestions());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              const Spacer(flex: 3),
              const Text(
                "Score",
                style: TextStyle(
                  fontSize: mediumFont,
                  color: secondaryColor,
                ),
              ),
              const Spacer(),
              Text(
                "${_qnController.numOfCorrectAnswer}/${_qnController.questions.length}",
                style: const TextStyle(
                  fontSize: mediumFont,
                  color: secondaryColor,
                ),
              ),
              const Spacer(flex: 3),
              InkWell(
                onTap: () => Get.to(const Home()),
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(defaultPadding * 0.75),
                    decoration: BoxDecoration(
                      gradient: primaryGradient,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Volver",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
