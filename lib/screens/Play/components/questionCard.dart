import 'package:app_emi/controllers/controllerQuestions.dart';
import 'package:flutter/material.dart';
import 'package:app_emi/utils/constants.dart';
import 'package:get/get.dart';
import '../../../models/Question.dart';
import 'option.dart';

class questionCard extends StatelessWidget {
  const questionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    controllerQuestions _controller = Get.put(controllerQuestions());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text(
                question.question,
                style: const TextStyle(
                  fontSize: smallFont,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              ...List.generate(
                question.options.length,
                (index) => option(
                  index: index,
                  text: question.options[index],
                  press: () => _controller.checkAnswer(question, index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
