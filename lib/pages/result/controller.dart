import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculatorController {
  CalculatorController({
    required double height,
    required double weight,
  }) : _bmi = weight / pow(height / 100, 2);

  final double _bmi;

  String getBMI() {
    debugPrint(_bmi.toString());
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getFeedback() {
    if (_bmi >= 25) {
      return 'Your BMI result is quite high, you should eat less!';
    } else if (_bmi > 18.5) {
      return 'Your BMI result is normal, you should continue what you are doing!';
    } else {
      return 'Your BMI result is quite low, you should eat more!';
    }
  }
}
