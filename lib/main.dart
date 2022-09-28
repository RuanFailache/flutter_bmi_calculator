import 'package:bmi_calculator/pages/input/page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF0A0E21),
          colorScheme: const ColorScheme.dark().copyWith(
            primary: const Color(0xFF0A0E21),
            secondary: Colors.purple,
            surface: const Color(0xFF1d1E33),
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Color(0xFF0A0E21),
          )),
      home: const InputPage(),
    );
  }
}
