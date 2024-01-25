import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(137, 252, 252, 251),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.outfit(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
            onPressed: startQuiz,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(251, 255, 255, 255),
              elevation: 8.0,
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.black,
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
