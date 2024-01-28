import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/QuizData/questions.dart';
import 'package:quiz_app/models/questions_summary.dart';
import 'package:quiz_app/quiz.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  late final ConfettiController _confettiController;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < widget.chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': widget.chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 2));

    // Check if all questions are answered correctly, then trigger confetti
    if (widget.chosenAnswers
        .asMap()
        .entries
        .every((entry) => entry.value == questions[entry.key].answers[0])) {
      _confettiController.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Center(
            child: Column(
              children: [
                ConfettiWidget(
                  shouldLoop: true,
                  confettiController: _confettiController,
                  blastDirectionality: BlastDirectionality.explosive,
                  blastDirection: -pi / 2,
                  emissionFrequency: 0.03,
                  gravity: 0.2,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'you answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 50,
              ),
              QuestionsSummary(summaryData),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const Quiz()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(251, 255, 255, 255),
                  elevation: 8.0,
                ),
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.black,
                ),
                label: const Text(
                  'Restart Quiz',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
