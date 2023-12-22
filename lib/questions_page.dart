import 'package:flutter/material.dart';
import 'package:quiz_app/QuizData/questions.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuestionPageState();
  }
}

class _QuestionPageState extends State<QuestionPage> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++; //increments value by 1
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

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
              style: GoogleFonts.outfit(
                color: const Color.fromARGB(255, 177, 215, 248),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            //children[] just want widgets in it no other lists are allowed
            // spreading technique - answer buttons from the list are pulled out and
            //placed as individual comma separated answer buttons
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(onTap: answerQuestion, answerText: answer);
              //passing function as a value (onTap)
            }),
          ],
        ),
      ),
    );
  }
}
