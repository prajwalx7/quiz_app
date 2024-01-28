import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    required this.onTap,
    required this.answerText,
    Key? key,
  }) : super(key: key);

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 5, 54, 91),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: const Color.fromARGB(0, 5, 15, 20),
              width: 2.0,
            ),
          ),
          child: Text(
            answerText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
