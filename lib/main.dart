import 'package:career_path_finder/Cv/CVFormScreen.dart';
import 'package:career_path_finder/Widget/Bottom_navigation%20Bar.dart';
import 'package:flutter/material.dart';

import 'Home/HomeScreen.dart';
import 'Quiz/Quiz_screen.dart';
import 'Reg/Login_screen.dart';
import 'Reg/Register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/login',
      routes: {
        '/Nav': (context) => const MyBottomNavScreen(),
        '/login': (context) => const HomeScreen(),
        '/quiz': (context) => const QuizScreen(),
        '/cv': (context) => const CVFormScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(), // এই স্ক্রিন পরের ধাপে বানাবো
      },
    );
  }
}
