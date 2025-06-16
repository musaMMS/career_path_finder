import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  const ResultScreen({super.key, required this.score});

  String getCareerSuggestion() {
    if (score == 3) return "🎉 You’re perfect for Flutter Developer!";
    if (score == 2) return "🎯 You might love UI/UX Design!";
    return "💡 Explore Digital Marketing!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Result")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your Score: $score / 3", style: const TextStyle(fontSize: 22)),
              const SizedBox(height: 20),
              Text(getCareerSuggestion(), style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Back to Home"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
