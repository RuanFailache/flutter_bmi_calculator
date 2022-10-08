import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomContainerHeight,
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor: const Color(0xFFEB1555),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Text(
            label,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
