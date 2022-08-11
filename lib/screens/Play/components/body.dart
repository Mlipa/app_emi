import 'package:app_emi/controllers/controllerQuestions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:app_emi/constants.dart';
import 'ProgressBar.dart';
import 'questionCard.dart';

class body extends StatelessWidget {
  const body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controllerQuestions _controllerQuestions = Get.put(controllerQuestions());
    return Stack(
      children: [
        WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: progressBar(),
              ),
              const SizedBox(height: defaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "Pregunta ${_controllerQuestions.questionNumber.value}",
                      style: const TextStyle(fontSize: smallFont),
                      children: [
                        TextSpan(
                          text: "/${_controllerQuestions.questions.length}",
                          style: const TextStyle(
                            fontSize: semiSmallFont,
                            color: secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(thickness: 1.5),
              const SizedBox(height: defaultPadding),
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _controllerQuestions.pageController,
                  onPageChanged: _controllerQuestions.updateTheQnNum,
                  itemCount: _controllerQuestions.questions.length,
                  itemBuilder: (context, index) => questionCard(
                    question: _controllerQuestions.questions[index],
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding)
            ],
          ),
        )
      ],
    );
  }
}
