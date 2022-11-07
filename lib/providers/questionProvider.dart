import 'package:app_emi/models/Question.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class QuestionProvider {
  Future<List<Question>> getQuestions() async {
    List<Question> myQuestions = [];

    try {
      return myQuestions;
    } catch (e) {
      return myQuestions;
    }
  }
}
