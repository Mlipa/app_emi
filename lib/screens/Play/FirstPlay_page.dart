import 'package:app_emi/controllers/controllerQuestions.dart';
import 'package:app_emi/screens/Play/components/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPlay_page extends StatelessWidget {
  const FirstPlay_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controllerQuestions _controller = Get.put(controllerQuestions());
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          ElevatedButton(
            onPressed: _controller.nextQuestion,
            child: const Text("skip"),
          )
        ],
      ),
      body: body(),
    );
  }
}
