import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white)),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF0A0E21),
            shadowColor: Colors.transparent),
      ),
      home: const InputPage(title: 'BMI Calculator'),
    );
  }
}
