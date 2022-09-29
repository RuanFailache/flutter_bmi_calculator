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
          surface: const Color(0xFF1D1E33),
          surfaceVariant: const Color(0xFF111328),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xFF0A0E21),
        ),
        textTheme: const TextTheme().copyWith(
          caption: const TextStyle(
            fontSize: 16,
            color: Color(0xFF8D8E98),
          ),
        ),
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: 12,
          ),
          overlayShape: const RoundSliderOverlayShape(
            overlayRadius: 24,
          ),
        ),
      ),
      home: const InputPage(),
    );
  }
}
