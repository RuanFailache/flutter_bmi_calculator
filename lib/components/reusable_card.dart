import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key? key,
    this.color,
    required this.cardChild,
  }) : super(key: key);

  final Color? color;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color ?? kInactiveCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: cardChild,
    );
  }
}
