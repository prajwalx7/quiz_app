import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {Key? key}) : super(key: key);

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 300,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: summaryData.map((data) {
              bool isCorrect = data['user_answer'] == data['correct_answer'];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color:
                            isCorrect ? Colors.greenAccent : Colors.redAccent,
                        borderRadius: BorderRadius.circular(10000),
                      ),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data['question']}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                isCorrect ? Icons.check : Icons.close,
                                color: isCorrect
                                    ? Colors.greenAccent
                                    : Colors.redAccent,
                                size: 16,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                data['user_answer'] as String,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: isCorrect
                                      ? Colors.greenAccent
                                      : Colors.redAccent,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(
                                Icons.check,
                                color: Colors.greenAccent,
                                size: 16,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                data['correct_answer'] as String,
                                style: const TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
