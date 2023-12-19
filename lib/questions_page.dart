import 'package:flutter/material.dart';
import 'package:quiz_app/QuizData/questions.dart';
import 'package:quiz_app/answer_button.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuestionPageState();
  }
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(context) {
    final currentQuestion = questions[0];

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          AnswerButton(onTap: () {}, answerText: currentQuestion.answers[0]),
          AnswerButton(onTap: () {}, answerText: currentQuestion.answers[1]),
          AnswerButton(onTap: () {}, answerText: currentQuestion.answers[2]),
          AnswerButton(onTap: () {}, answerText: currentQuestion.answers[3]),
        ],
      ),
    );
  }
}
