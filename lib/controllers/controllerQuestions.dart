import 'package:app_emi/models/Question.dart';
import 'package:app_emi/screens/score/score_page.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class controllerQuestions extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _question = question_data
      .map(
        (question) => Question(
          id: question['id'],
          question: question['question'],
          answer: question['answer_index'],
          options: question['options'],
        ),
      )
      .toList();

  List<Question> get questions => this._question;

  bool _isAnswered = false;
  bool get isAnwered => this._isAnswered;

  late int _correctAnswer;
  int get correctAnswerd => this._correctAnswer;

  late int _selectAnswer;
  int get selectAnswer => this._selectAnswer;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAnswer = 0;
  int get numOfCorrectAnswer => this._numOfCorrectAnswer;

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  @override
  void onInit() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 60));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward().whenComplete(() => nextQuestion());

    _pageController = PageController();

    super.onInit();
  }

  void checkAnswer(Question question, int selecdIndex) {
    _isAnswered = true;
    _correctAnswer = question.answer;
    _selectAnswer = selecdIndex;

    if (_correctAnswer == _selectAnswer) _numOfCorrectAnswer++;

    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _question.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 2), curve: Curves.ease);

      _animationController.reset();

      _animationController.forward().whenComplete(() => nextQuestion());
    } else {
      Get.to(score_page());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
