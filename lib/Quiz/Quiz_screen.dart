import 'package:flutter/material.dart';

import 'Question_screen.dart';
import 'Result_screeen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool answered = false;

  void checkAnswer(int selectedIndex) {
    if (answered) return;

    setState(() {
      answered = true;
      if (selectedIndex == questions[currentQuestionIndex].correctIndex) {
        score++;
      }
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
          answered = false;
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => ResultScreen(score: score)),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(title: const Text("Career Quiz")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question ${currentQuestionIndex + 1} of ${questions.length}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              currentQuestion.question,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...List.generate(currentQuestion.options.length, (index) {
              final isCorrect = index == currentQuestion.correctIndex;
              final isSelected = answered && index == currentQuestion.correctIndex;

              return Card(
                color: answered
                    ? (index == currentQuestion.correctIndex
                    ? Colors.green.shade100
                    : Colors.red.shade100)
                    : null,
                child: ListTile(
                  title: Text(currentQuestion.options[index]),
                  onTap: () => checkAnswer(index),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
