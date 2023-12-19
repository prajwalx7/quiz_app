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
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            //children[] just want widgets in it no other lists are allowed
            // spreading technique - answer buttons from the list are pulled out and
            //placed as individual comma separated answer buttons
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(onTap: () {}, answerText: answer);
            }),
          ],
        ),
      ),
    );
  }
}
