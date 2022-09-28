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
    final appColorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color ?? appColorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: cardChild,
    );
  }
}
