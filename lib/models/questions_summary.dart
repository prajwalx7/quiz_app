import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

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
              bool isCorrtect = data['user_answer'] == data['correct_answer'];
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              decoration: BoxDecoration(
                                color: isCorrtect
                                    ? Colors.greenAccent
                                    : Colors.redAccent,
                                borderRadius: BorderRadius.circular(10000),
                              ),
                              child: Text(((data['question_index'] as int) + 1)
                                  .toString()),
                            ), // dont ask me what I've done here
                            Container(
                              width: MediaQuery.of(context).size.width - 50,
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${data['question']}'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    data['user_answer'] as String,
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    data['correct_answer'] as String,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
